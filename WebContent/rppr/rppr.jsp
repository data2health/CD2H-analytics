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
            Jump to:
            <ul>
                <li><a href="#admin">admin</a>
                <li><a href="#info_maturity">info_maturity</a>
                <li><a href="#next_gen">next_gen</a>
                <li><a href="#resource_discovery">resource_discovery</a>
                <li><a href="#cloud">cloud</a>
            </ul>
            <b>Note: </b> This rendition of the RPPR data is default using the CD2H Labs style sheet, and does not reflect
            what the font sizes, etc. will be in the final document.  HTML header levels are correct, though.
            <hr><a name="admin"/>
            <cd2h:RPPRasHTML coreName="admin"/>
            <hr><a name="info_maturity"/>
            <cd2h:RPPRasHTML coreName="informatics-maturity"/>
            <hr><a name="next_gen"/>
            <cd2h:RPPRasHTML coreName="next-gen-data-sharing"/>
            <hr><a name="resource_discovery"/>
            <cd2h:RPPRasHTML coreName="resource-discovery"/>
            <hr><a name="cloud"/>
            <cd2h:RPPRasHTML coreName="software-cloud-infrastructure"/>
         </div>
        <jsp:include page="../footer.jsp" flush="true" />
</body>

</html>
