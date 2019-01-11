<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="rdf" uri="http://icts.uiowa.edu/RDFUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>
    <sql:query var="proposals" dataSource="jdbc/VIVOTagLib" >
        select id,title,url,regexp_replace(pitch, E'[\\n\\r]+', ' ', 'g' ) as pitch from cd2h_phase2.proposal where url is not null and title!~'Disambiguation' and id not in (select merged from cd2h_phase2.merge) order by id;
    </sql:query>
    <c:forEach items="${proposals.rows}" var="row">
    	<c:set var="title" value="${row.title}"/>
    	<c:set var="pitch" value="${row.pitch}"/>
	    <sql:query var="mergers" dataSource="jdbc/VIVOTagLib" >
	        select id,title,url,regexp_replace(pitch, E'[\\n\\r]+', ' ', 'g' ) as pitch from cd2h_phase2.proposal where id in (select merged from cd2h_phase2.merge where target = ?::int) order by id;
	        <sql:param>${row.id}</sql:param>
	    </sql:query>
	    <c:forEach items="${mergers.rows}" var="subrow">
	    	<c:set var="title" value="${title} / ${subrow.title}"/>
	    	<c:set var="pitch" value="${pitch} / ${subrow.pitch}"/>
	    </c:forEach>
        <graph:node uri="${row.url}" label="${title} -- ${pitch}" group="1" score="1"/>
    </c:forEach>
		
    <sql:query var="persons" dataSource="jdbc/VIVOTagLib" >
        select id,first||' '||last as name from cd2h_phase2.person where id not in (select pid from cd2h_phase2.lead) and id in (select pid from cd2h_phase2.member) order by id;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="person${row.id}" label="${row.name}" group="2" score="0.1"/>
    </c:forEach>

    <sql:query var="persons" dataSource="jdbc/VIVOTagLib" >
        select id,first||' '||last as name from cd2h_phase2.person where id in (select pid from cd2h_phase2.lead) and id in (select pid from cd2h_phase2.member) order by id;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="person${row.id}" label="${row.name}" group="3" score="0.5"/>
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/VIVOTagLib">
        select url,pid from cd2h_phase2.member natural join cd2h_phase2.proposal where url is not null and pid not in (select pid from cd2h_phase2.lead);
    </sql:query>
    <c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
        <graph:edge source="${row.url}" target="person${row.pid}"  weight="0.01" />
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/VIVOTagLib">
        select url,pid from cd2h_phase2.member natural join cd2h_phase2.proposal where url is not null and pid in (select pid from cd2h_phase2.lead);
    </sql:query>
    <c:forEach items="${edges.rows}" var="row" varStatus="rowCounter">
        <graph:edge source="${row.url}" target="person${row.pid}"  weight="0.1" />
    </c:forEach>

	{
	  "nodes":[
		<graph:foreachNode > 
			<graph:node>
			    {"url":"<graph:nodeUri/>","name":"<graph:nodeLabel/>","group":<graph:nodeGroup/>,"score":<graph:nodeScore/>}<c:if test="${ ! isLastNode }">,</c:if>
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
