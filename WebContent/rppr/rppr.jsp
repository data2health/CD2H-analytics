<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="cd2h" uri="http://cd2h.org/CD2HTagLib"%>


<!DOCTYPE html>
<html lang="en-US">
<jsp:include page="../head.jsp" flush="true">
    <jsp:param name="title" value="CD2H RPPR" />
</jsp:include>
<style type="text/css" media="all">
@import "../resources/layout.css";
</style>

<body class="home page-template-default page page-id-6 CD2H">
    <jsp:include page="../header.jsp" flush="true" />

    <div class="container pl-0 pr-0">
        <br/> <br/>
        <div class="container-fluid">

            <h1>CD2H RPPR</h1>
            <hr>
            <cd2h:RPPRasHTML coreName="admin"/>
            <cd2h:RPPRasHTML coreName="informatics-maturity"/>
            <cd2h:RPPRasHTML coreName="next-gen-data-sharing"/>
            <cd2h:RPPRasHTML coreName="resource-discovery"/>
            <cd2h:RPPRasHTML coreName="software-cloud-infrastructure"/>
         </div>
        <jsp:include page="../footer.jsp" flush="true" />
</body>

</html>
