<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="head.jsp" flush="true">
	<jsp:param name="title" value="CD2H Analytics" />
</jsp:include>
<style type="text/css" media="all">
@import "resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br /> <br /> <br /> <br />
		<div class="container-fluid">

			<h1>CD2H Analytics</h1>
			<hr>
			<ol class="bulletedList">
			<li><a href="github/repos.jsp?mode=org">Explore CD2H GitHub Organization</a>
            <li><a href="proposals/display.jsp">Explore CD2H Phase 2 Proposals</a>
            <li><a href="incite/browse.jsp">Explore CTSA Hub Website Content</a>
            </ol>
		</div>
		<jsp:include page="footer.jsp" flush="true" />
</body>

</html>
