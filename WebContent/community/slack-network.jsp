<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="rdf" uri="http://icts.uiowa.edu/RDFUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
	<jsp:param name="title" value="N3C Analytics" />
</jsp:include>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
	<jsp:include page="../header.jsp" flush="true" />

	<div class="container pl-0 pr-0">
		<br/> <br/>
		<div id="content"  class="container-fluid">
			<h2>The N3C Team and Investigators</h2>
			<h3>Legend</h3>
			<ul>
				<li>circles - People
					<ul>
						<li><span  style="color:blue">blue - CD2H personnel</span>
						<li><span  style="color:red">red - Palantir personnel</span>
						<li><span  style="color:green">green - NIH personnel</span>
						<li><span  style="color:orange">orange - N3C participants</span>
					</ul>
				<li>squares - Channels
					<ul>
						<li><span  style="color:blue">blue - Administrative</span>
						<li><span  style="color:orange">oorange - Domain focused</span>
					</ul>
				<li>edges - contributions by a person to a channel
			</ul>
			
			<div id="graph"></div>

				<c:url var="encodedMapURL" value="slack-network-data.jsp">
					<c:param name="detectionAlg" value="${param.detectionAlg}"/>
					<c:param name="resolution" value="${param.resolution}"/>
					<c:param name="mode" value="${param.mode}"/>
					<c:param name="query" value="${param.query}"/>
					<c:param name="selectedNode" value="${param.selectedNode}"/>
					<c:param name="radius" value="${param.radius}"/>
				</c:url>
				<jsp:include page="../graphs/forceGraphN3C.jsp" flush="true">
					<jsp:param name="charge" value="-200" />
					<jsp:param name="ld" value="20" />
					<jsp:param name="data_page" value="${encodedMapURL}" />
					<jsp:param name="detectionAlg" value="${param.detectionAlg}"/>
				</jsp:include>
		</div>
		<jsp:include page="../footer.jsp" flush="true" />
		</div>
</body>
</html>
