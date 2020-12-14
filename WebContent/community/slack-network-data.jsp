<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="rdf" uri="http://icts.uiowa.edu/RDFUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<graph:graph>

	<sql:query var="persons" dataSource="jdbc/analytics">
		select real_name,coalesce(type,'user') as type,count from cd2h_slack.node natural left outer join cd2h_slack.person_type;
	</sql:query>
	<c:forEach items="${persons.rows}" var="person" varStatus="rowCounter">
		<c:choose>
		<c:when test="${person.type ==  'NIH'}">
			<graph:node uri="${person.real_name}" label="${person.real_name}" group="3" score="${person.count *  3}"/>
		</c:when>
		<c:when test="${person.type ==  'Palantir'}">
			<graph:node uri="${person.real_name}" label="${person.real_name}" group="3" score="${person.count *  3}"/>
		</c:when>
		<c:when test="${person.type ==  'CD2H'}">
			<graph:node uri="${person.real_name}" label="${person.real_name}" group="0" score="${person.count *  3}"/>
		</c:when>
		<c:otherwise>
			<graph:node uri="${person.real_name}" label="${person.real_name}" group="1" score="${person.count *  3}"/>
		</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<sql:query var="channels" dataSource="jdbc/analytics">
		select name,coalesce(type,'domain') as type,count from cd2h_slack.node_channel natural left outer join cd2h_slack.channel_type where name != 'general';
	</sql:query>
	<c:forEach items="${channels.rows}" var="channel" varStatus="rowCounter">
		<c:choose>
		<c:when test="${channel.type ==  'admin'}">
			<graph:node uri="${channel.name}" label="${channel.name}" group="4" score="${channel.count * 3}"/>
		</c:when>
		<c:otherwise>
			<graph:node uri="${channel.name}" label="${channel.name}" group="5" score="${channel.count * 3}"/>
		</c:otherwise>
		</c:choose>
	</c:forEach>

	<sql:query var="edges" dataSource="jdbc/analytics">
		select real_name,name,count from cd2h_slack.edge where name != 'general';
	</sql:query>
	<c:forEach items="${edges.rows}" var="edge" varStatus="rowCounter">
		<graph:edge source="${edge.real_name}" target="${edge.name}"  weight="${edge.count}" />
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
