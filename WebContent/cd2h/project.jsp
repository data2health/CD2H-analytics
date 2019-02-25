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
				<json:setAPI API="CD2H">
					<json:object queryName="project" parameter="proj:${param.id}" targetName="projectById">
                        <h1><json:data label="title"/></h1>
                        <p><json:data label="description"/></p>
                        <p><b>Vertical: </b><json:data label="vertical"/></p>
                        <p><b>Thematic Area: </b><json:data label="thematicArea"/></p>
                        <p><b>GitHub: </b><a href="<json:data label="github"/>"><json:data label="github"/></a></p>
                        <p><b>Project Lead(s)</b>
                        <json:object targetName="rolesById">
                        <ol class="bulletedList">
                        <json:array label="nodes">
                            <json:object targetName="personByEmailAddress">
                                <li><json:data label="preferredFirstName"/> <json:data label="lastName"/>
                            </json:object>
                        </json:array>
                        </ol>
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
