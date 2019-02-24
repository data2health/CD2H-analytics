<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="json" uri="http://labs.cd2h.org/JSONTagLib"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="CD2H GitHub Repositories" />
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
				<h1>CD2H GitHub Repositories</h1>
				<p>
					These are repositories flagged with "data2health" as a topic. (<a
						href="repos.jsp?mode=org">switch to organization view</a>)
				</p>
				<json:setAPI API="CD2H">
					<json:object queryName="project" parameter="proj:${param.id}" targetName="projectById">
                        <h2><json:data label="title"></json:data></h2>
                        <p><json:data label="description"></json:data></p>
                        <p><b>Vertical: </b><json:data label="vertical"></json:data></p>
                        <p><b>Thematic Area: </b><json:data label="thematicArea"></json:data></p>
                        <p><b>GitHub: </b><json:data label="github"></json:data></p>
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
