<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>

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

			<div style="width: 100%; float: left">
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

<jsp:include page="dashboardContent.jsp" flush="true" />
