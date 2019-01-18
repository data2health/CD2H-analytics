<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>

<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="CD2H Phase 2 Landscape" />
</jsp:include>
<style type="text/css" media="all">
@import "resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br /> <br /> <br /> <br />
		<div class="container-fluid">

			<h2>Proposal Mergers</h2>
			<p><a href="index.jsp">Visualize the proposal landscape</a></p>
				<form method='POST' action='merge.jsp'>
					Merge: target ID : <input name="target" value="${param.target}" size=5> merged ID :	<input name="merged" value="${param.merged}" size=5> <input	type=submit name=submitButton value=submit>
					</table>
				</form>
			<hr/>
			<sql:query var="proposals" dataSource="jdbc/loki">
				select id,title,url,regexp_replace(pitch, E'[\\n\\r]+', ' ', 'g' ) as pitch from cd2h_phase2.proposal where url is not null and title!~'Disambiguation' and id not in (select merged from cd2h_phase2.merge) order by id;
			</sql:query>
			<dl>
				<c:forEach items="${proposals.rows}" var="row">
					<dt>
						[${row.id}] : ${row.title }
					</dt>
					<dd>${row.pitch}
					<sql:query var="mergers" dataSource="jdbc/loki">
						select id,title,url,regexp_replace(pitch, E'[\\n\\r]+', ' ', 'g' ) as pitch from cd2h_phase2.proposal where url is not null and title!~'Disambiguation' and id in (select merged from cd2h_phase2.merge where target = ?::int) order by id;
						<sql:param>${row.id}</sql:param>
					</sql:query>
					<ul>
						<c:forEach items="${mergers.rows}" var="subrow">
							<li><b>[${subrow.id}] : ${subrow.title} : <a href="split.jsp?target=${row.id}&merged=${subrow.id}">split</a> : </b>${subrow.pitch}</li>
						</c:forEach>
					</ul>
					</dd>
				</c:forEach>
			</dl>
		</div>
		<jsp:include page="footer.jsp" flush="true" />
</body>

</html>
