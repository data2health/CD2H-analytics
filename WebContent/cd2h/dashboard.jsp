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

table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid grey;
}

tbody th {
	text-align: center;
	font-size: 15px;
	padding: 5px;
}

thead td {
	cursor: s-resize;
	font-size: 15pt;
	font-weight: bold;
	text-align: center;
	padding: 5px;
}

tbody td {
	font-size: 11pt;
	max-width: 570px;
	padding: 5px;
	border-left: solid 1px #000;
}

ul > li {
    margin-left: 30px;
}
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="../header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br/>
		<div class="container-fluid">
			<div style="width: 100%; float: left">
				<h1>CD2H GitHub Dashboard</h1>
				<ul>
					<li>The Last Updated field indicates the date of the most recent change to the Repository
						<ul>
							<li> The table is currently ordered by most recent activity</li>
						</ul>
					</li>
					<li>Names of Repositories are as they appear in GitHub: Clicking on them takes you to more details.</li>
					<li>For both the Milestones and Issues:
						<ul>
							<li>Light blue bars represent all instances (100%)</li>
							<li>Darker blue bars indicate the percentage completed</li>
							<li>Hover over either to see their exact counts</li>
						</ul>
					</li>
					<li>All data is current as of the last browser refresh</li>
				</ul>
				

				<table>
					<thead>
						<tr>
							<td>Project</td>
							<td>Description</td>
							<td>Last Updated</td>
							<td>Milestones</td>
							<td>Issues</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>

			</div>
			<div style="width: 100%; float: left">
				<jsp:include page="../footer.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>

<jsp:include page="dashboardContent.jsp" flush="true" />

</html>
