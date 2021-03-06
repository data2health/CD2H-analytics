<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="CD2H Phase 2 Landscape" />
</jsp:include>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="../header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br /> <br /> 
		<div class="container-fluid">
			<h1>CD2H Phase 2 Landscape</h1>
			<ul>
				<li>Large blue icons are projects - mousing over shows the title and elevator pitch, double-clicking on them takes you to the proposal
				<li>Photos are proposal leads - mouse over to see a name
				<li>Small blue icons are other named personnel (only folks mentioned specifically on the dashboard appear) - mouse over to see a name
			</ul>
           <div id="content">
                <div id="graph"></div>
            </div>
                <c:url var="encodedMapURL" value="data.jsp">
                    <c:param name="detectionAlg" value="site"/>
                    <c:param name="resolution" value="1"/>
                    <c:param name="mode" value="${param.mode}"/>
                    <c:param name="query" value="${param.query}"/>
                    <c:param name="selectedNode" value="${param.selectedNode}"/>
                    <c:param name="radius" value="${param.radius}"/>
                </c:url>
                <jsp:include page="../graphs/forcePhoto.jsp" flush="true">
                    <jsp:param name="charge" value="-200" />
                    <jsp:param name="ld" value="80" />
                    <jsp:param name="data_page" value="${encodedMapURL}" />
                    <jsp:param name="detectionAlg" value="sites"/>
                </jsp:include>
		</div>
		<jsp:include page="../footer.jsp" flush="true" />
</body>

</html>
