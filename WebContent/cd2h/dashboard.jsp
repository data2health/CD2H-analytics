<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="CD2H Project Dashboard" />
</jsp:include>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="../header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br />
		<div class="container-fluid">
			<br>
			<div style="width: 100%; float: left">
				<h1>CD2H GitHub Dashboard</h1>
				<p>Note that the progress bars below misbehave in macOs Chrome (and possibly others).</p>
				<p>Current ordering is by decreasing order of last update of the project repository.</p>
				<json:setAPI API="GitHub">
					<json:object queryName="projectDashboard" targetName="organization">
					   <json:object targetName="repositories">
					   <c:set var="rowCount" value="${1}"/>
                        <table>
                        <tr><th>Project</th><th>Description</th><th>Updated At</th><th>Milestones</th><th>Issues</th></tr>
						<json:array label="nodes">
						  <json:object>
						      <c:set var="repo"><json:data label="name"/></c:set>
							<sql:query var="projects" dataSource="jdbc/loki">
							    select repo_name from dashboard.dashboard where repo_name = ?;
							    <sql:param><json:data label="name"/></sql:param>
							</sql:query>
							<c:forEach items="${projects.rows}" var="row" varStatus="rowCounter">
							    <tr><td><a href="<json:data label="url"/>"><json:data label="name"/></a></td>
							    <td><json:data label="description"/></td>
                                <td><json:data label="pushedAt"/></td>
							    <json:object targetName="milestones">
							     <c:set var="completed" value="0"/>
							     <c:set var="total"><json:data label="totalCount"/></c:set>
							         <json:array label="nodes">
							             <json:object>
							                 <c:set var="closed"><json:data label="closed"/></c:set>
							                 <c:if test="${closed == 'true' }"><c:set var="completed" value="${completed + 1 }"/></c:if>
							             </json:object>
							         </json:array>
							     <td>
							     <jsp:include page="../graphs/singleHorizontalStackedBar.jsp" flush="true" >
							         <jsp:param value="${completed},${total-completed}" name="csv"/>
                                     <jsp:param value="milestones${rowCount}" name="repo"/>
							     </jsp:include>
							     </td>
							    </json:object>
                                <json:object targetName="issues">
                                 <c:set var="completed" value="0"/>
                                 <c:set var="total"><json:data label="totalCount"/></c:set>
                                     <json:array label="nodes">
                                         <json:object>
                                             <c:set var="closed"><json:data label="closed"/></c:set>
                                             <c:if test="${closed == 'true' }"><c:set var="completed" value="${completed + 1 }"/></c:if>
                                         </json:object>
                                     </json:array>
                                    <td>
                                 <jsp:include page="../graphs/singleHorizontalStackedBar.jsp" flush="true" >
                                     <jsp:param value="${completed},${total-completed}" name="csv"/>
                                     <jsp:param value="issues${rowCount}" name="repo"/>
                                 </jsp:include>
                                    </td></tr>
                                </json:object>
							</c:forEach>
						  </json:object>
						  <c:set var="rowCount" value="${rowCount + 1}"/>
						</json:array>
                        </table>
						</json:object>
					</json:object>
				</json:setAPI>
			</div>
			<div style="width: 100%; float: left">
				<jsp:include page="../footer.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>

</html>
