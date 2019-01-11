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
        select id,title,url from cd2h_phase2.proposal where url is not null order by id;
    </sql:query>
    <c:forEach items="${proposals.rows}" var="row">
        <graph:node uri="${row.url}" label="${row.title}" group="1" score="1"/>
    </c:forEach>
		
    <sql:query var="persons" dataSource="jdbc/VIVOTagLib" >
        select id,first||' '||last as name from cd2h_phase2.person order by id;
    </sql:query>
    <c:forEach items="${persons.rows}" var="row">
        <graph:node uri="person${row.id}" label="${row.name}" group="2" score="0.2"/>
    </c:forEach>

    <sql:query var="edges" dataSource="jdbc/VIVOTagLib">
        select url,pid from cd2h_phase2.member natural join cd2h_phase2.proposal where url is not null;
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
