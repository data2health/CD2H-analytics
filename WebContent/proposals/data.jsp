<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="rdf" uri="http://icts.uiowa.edu/RDFUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
    <sql:query var="proposals" dataSource="jdbc/loki" >
        select id,title,proposal_url,regexp_replace(pitch, E'[\\n\\r]+', ' ', 'g' ) as pitch from cd2h_phase2.proposal where proposal_url is not null and pitch is not null order by id;
    </sql:query>
    <c:forEach items="${proposals.rows}" var="row">
    	<c:set var="title" value="${row.title}"/>
    	<c:set var="pitch" value="${row.pitch}"/>
        <graph:node uri="${row.proposal_url}" label="${title} -- ${pitch}" group="1" score="1" auxString="../images/cd2h_invent.png"/>
    </c:forEach>
		
    <sql:query var="persons" dataSource="jdbc/loki" >
        select id,first||' '||last as name from cd2h_phase2.person where id not in (select pid from cd2h_phase2.lead) and id in (select pid from cd2h_phase2.member) order by id;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="person${row.id}" label="${row.name}" group="2" score="0.1" auxString="../images/person_icon.png"/>
    </c:forEach>

    <sql:query var="persons" dataSource="jdbc/loki" >
        select id,first||' '||last as name, '../images/cd2h_imgs/'||lower(first)||'_'||lower(last)||'.png' as file from cd2h_phase2.person where id in (select pid from cd2h_phase2.lead) and id in (select pid from cd2h_phase2.member) order by id;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="person${row.id}" label="${row.name}" group="3" score="0.5" auxString="${row.file}"/>
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/loki">
        select proposal_url,pid from cd2h_phase2.lead natural join cd2h_phase2.proposal where proposal_url is not null;
    </sql:query>
    <c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
        <graph:edge source="${row.proposal_url}" target="person${row.pid}"  weight="0.2" />
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/loki">
        select proposal_url,pid from cd2h_phase2.member natural join cd2h_phase2.proposal where proposal_url is not null and (id,pid) not in (select id,pid from cd2h_phase2.lead);
    </sql:query>
    <c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
        <graph:edge source="${row.proposal_url}" target="person${row.pid}"  weight="0.01" />
    </c:forEach>

	{
	  "nodes":[
		<graph:foreachNode > 
			<graph:node>
			    {"url":"<graph:nodeUri/>","image_link":"<graph:nodeAuxString/>","name":"<graph:nodeLabel/>","group":<graph:nodeGroup/>,"score":<graph:nodeScore/>}<c:if test="${ ! isLastNode }">,</c:if>
			</graph:node>
		</graph:foreachNode>
		],
	  "links":[
	  	<graph:foreachEdge>
	  		<graph:edge>
			    {"source":<graph:edgeSource/>,"target":<graph:edgeTarget/>,"value":<graph:edgeWeight/>}<c:if test="${ ! isLastEdge }">,</c:if>
	  		</graph:edge>
	  	</graph:foreachEdge>
	  ],
	  "sites":[
		<graph:foreachSiteID>
			{"id":<graph:SiteID/>, "label":"<graph:SiteName/>"}<c:if test="${!isLastID}">,</c:if>
		</graph:foreachSiteID>
		]
	}
	
	
</graph:graph>
