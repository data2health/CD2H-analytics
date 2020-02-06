<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<html>
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
</html>
                