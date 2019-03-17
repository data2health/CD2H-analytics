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
			<div style="width: 100%; float: left">
				<h1>CD2H Phase 2 Project: <a href="https://github.com/data2health/${param.repo}">${param.repo}</a></h1>
				<br><br>
				<json:setAPI API="GitHub">
					<json:object queryName="repoDetail" targetName="repository" parameter="repo:${param.repo}" >
					   <p><b>GitHub Description:</b> <json:data label="description"/></p>
					   <p><b>GitHub Repository Last Modified At:</b> <json:data label="pushedAt"/></p>
					   <sql:query var="project" dataSource="jdbc/loki">
					       select * from google.project,dashboard.dashboard where title=updated_title and repo_name=?;
					       <sql:param>${param.repo}</sql:param>
					   </sql:query>
					   <c:forEach items="${project.rows}" var="row" varStatus="rowCounter">
					       <p>${row.description}</p>
					       <div style="width: 48%; padding: 0px 10px 0px 0px; float: left">
					       <h3>Lead(s)</h3>
					       <table>
					       <tr><th>Name</th><th>GitHub Handle</th><th>Site</th></tr>
					       <sql:query var="person" dataSource="jdbc/loki">
					           select * from google.role natural join google.person where id=?::int and role='Lead' order by last_name,preferred_first_name;
					           <sql:param>${row.id}</sql:param>
					       </sql:query>
					       <c:forEach items="${person.rows}" var="subrow" varStatus="subrowCounter">
					           <tr><td>${subrow.preferred_first_name} ${subrow.last_name}</td><td><a href="${subrow.github_handle_url}">${subrow.github_handle_url}</a></td><td>${subrow.institution}</td></tr>
					       </c:forEach>
					       </table>
					       <br/>
					       <h3>Contributors</h3>
                           <table>
                           <tr><th>Name</th><th>GitHub Handle</th><th>Site</th></tr>
                           <sql:query var="person" dataSource="jdbc/loki">
                               select * from google.role natural join google.person where id=?::int and role='Contributor' order by last_name,preferred_first_name;
                               <sql:param>${row.id}</sql:param>
                           </sql:query>
                           <c:forEach items="${person.rows}" var="subrow" varStatus="subrowCounter">
                               <tr><td>${subrow.preferred_first_name} ${subrow.last_name}</td><td><a href="${subrow.github_handle_url}">${subrow.github_handle_url}</a></td><td>${subrow.institution}</td></tr>
                           </c:forEach>
                           </table>
                           <br/>
                           </div>
					       <div style="width: 48%; padding: 0px 10px 0px 0px; float: left">
					       <h3>Mailing list only</h3>
                           <table>
                           <tr><th>Name</th><th>GitHub Handle</th><th>Site</th></tr>
                           <sql:query var="person" dataSource="jdbc/loki">
                               select * from google.role natural join google.person where id=?::int and role='Mailing list only' order by last_name,preferred_first_name;
                               <sql:param>${row.id}</sql:param>
                           </sql:query>
                           <c:forEach items="${person.rows}" var="subrow" varStatus="subrowCounter">
                               <tr><td>${subrow.preferred_first_name} ${subrow.last_name}</td><td><a href="${subrow.github_handle_url}">${subrow.github_handle_url}</a></td><td>${subrow.institution}</td></tr>
                           </c:forEach>
                           </table>
                           <br/>
					   </c:forEach>
                           </div>
                           <div style="width: 100%; padding: 0px 120px 0px 0px; float: left">
                               <json:object targetName="milestones">
                                    <json:array label="nodes">
                                    <c:if test="${json:isFirstArrayElement() == true}">
                                        <h3>Milestones</h3>
                                        <table>
                                        <tr><th>Title</th><th>Due On</th><th>Description</th><th>Creator</th></tr>
                                    </c:if>
                                       <json:object>
                                               <tr>
                                                <td><json:data label="title"/></td>
                                                <td><json:data label="dueOn"/></td>
                                                <td><json:data label="description"/></td>
                                                <td><json:object targetName="creator"><a href="https://github.com/<json:data label="login"/>"><json:data label="login"/></a></json:object></td>
                                               </tr>
                                        </json:object>
                                    <c:if test="${json:isLastArrayElement() == true}">
                                     </table>
                                   </c:if>
                                   </json:array>
                               </json:object>
                               <br/>
                              <json:object targetName="issues">
                                    <json:array label="nodes">
                                    <c:if test="${json:isFirstArrayElement() == true}">
                                        <h3>Issues</h3>
                                        <table>
                                        <tr><th>Milestone</th><th>#</th><th>Title</th><th>Description</th><th>Creator</th><th>Assignee(s)</th></tr>
                                    </c:if>
                                       <json:object>
                                               <tr>
                                                <td><json:object targetName="milestone"><json:data label="title"/></json:object></td>
                                                <td><json:data label="number"/></td>
                                                <td><json:data label="title"/></td>
                                                <td><json:data label="body"/></td>
                                                <td><json:object targetName="author"><a href="https://github.com/<json:data label="login"/>"><json:data label="login"/></a></json:object></td>
                                               <td>
                                                    <json:object targetName="assignees">
                                                        <json:array label="nodes">
                                                        <c:if test="${json:isFirstArrayElement() == true}">
                                                            <ol class="bulletedList">
                                                        </c:if>
                                                        <json:object>
                                                            <li><a href="https://github.com/<json:data label="login"/>"><json:data label="login"/></a>
                                                        </json:object>
                                                        <c:if test="${json:isLastArrayElement() == true}">
                                                            </ol>
                                                        </c:if>
                                                        </json:array>
                                                    </json:object>
                                               </td>
                                               </tr>
                                        </json:object>
                                    <c:if test="${json:isLastArrayElement() == true}">
                                     </table>
                                   </c:if>
                                   </json:array>
                               </json:object>
                               </div>
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
