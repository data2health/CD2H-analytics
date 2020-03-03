<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>

<style type="text/css" media="all">
body {
    font-size: 84%;
    font-family: Arial,Helvetica,sans-serif;
    color: #000;
    margin: 0;
    padding: 0;
    line-height: 1.5em;
}

table {
  border-collapse: collapse;
}

table, th, td {
  border: 1px solid grey;
}

tbody th {
    font-size: 84%;
    font-family: Arial,Helvetica,sans-serif;
	text-align: center;
	font-size: 15px;
	padding: 5px;
}

thead td {
    font-size: 84%;
    font-family: Arial,Helvetica,sans-serif;
	cursor: s-resize;
	font-size: 15pt;
	font-weight: bold;
	text-align: center;
	padding: 5px;
}

tbody td {
    font-size: 84%;
    font-family: Arial,Helvetica,sans-serif;
	font-size: 11pt;
	max-width: 570px;
	padding: 5px;
	border-left: solid 1px #000;
}

ul > li {
    margin-left: 30px;
}
</style>

<html>
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
</html>
