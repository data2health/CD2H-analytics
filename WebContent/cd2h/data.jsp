<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="rdf" uri="http://icts.uiowa.edu/RDFUtil"%>
<%@ taglib prefix="graph" uri="http://slis.uiowa.edu/graphtaglib"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>

{
	  "nodes":[
<c:set var="rowCount" value="${1}"/>
<json:setAPI API="GitHub">
	<json:object queryName="projectDashboardsingle" targetName="search">
	<c:set var="repoCount"><json:data label="repositoryCount"/></c:set>
	<json:array label="edges">
		{<json:object targetName="node">
		   "url": "<json:data label="url"/>",
		   "name": "<json:data label="name"/>",
		   "description": "<json:data label="description"/>", 
		   "updatedat": "<json:data label="updatedAt"/>",
		    <json:object targetName="open_milestones">
		    	"open_milestones": <json:data label="totalCount"/>,
		    </json:object>
		    <json:object targetName="closed_milestones">
		    	"closed_milestones": <json:data label="totalCount"/>,
		    </json:object>
		    <json:object targetName="total_milestones">
		    	"total_milestones": <json:data label="totalCount"/>,
		    </json:object>
		    <json:object targetName="open_issues">
		    	"open_issues": <json:data label="totalCount"/>,
		    </json:object>
		    <json:object targetName="closed_issues">
		    	"closed_issues": <json:data label="totalCount"/>,
		    </json:object>
		    <json:object targetName="total_issues">
		    	"total_issues": <json:data label="totalCount"/>
		    </json:object>
		</json:object>} <c:if test="${rowCount != repoCount}">,</c:if>
		<c:set var="rowCount" value="${rowCount + 1}"/>
	</json:array>
	</json:object>
</json:setAPI>
]
	}
