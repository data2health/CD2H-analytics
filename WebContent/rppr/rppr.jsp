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


body{
	font-weight:lighter;
}

#cd2h-administration-core, #cd2h-informatics-maturity-and-best-practices-core, 
#cd2h-next-generation-data-sharing-and-analytics-core, #cd2h-resource-discovery-core,
#cd2h-tools-and-cloud-infrastructure-core{
	text-align:center;
	color:#184c7a;
	text-decoration: underline;
	font-size:25;
	padding-top: 60px;
}

#current-projects{
	text-align:center;
	padding-top: 25px;
	font-weight: 700;
}

h1{
	font-size:23pt;
	color:#2f3338;
	font-weight: 500;
}

h2{
	font-size:20pt;
	padding-left:15px;
	font-weight: 500;
}

h3{
	font-size:15pt;
	padding-left:30px;
	font-weight: 500;
}

h4{
	font-weight: 500;
	font-size:13pt;
	color:#184c7a;
    text-decoration: underline;
}

h5{
	font-weight: 500;
	font-size: 12pt;
}

p{
	padding-left: 50px;
/* 	text-indent: 50px; */
}

ul{
	padding-left: 65px;
}

li p, li ul, li ul li{
	line-height: 1.1;
	font-weight: lighter;
	font-size: 11pt;
}

li p{
	padding-left: 5px;
	padding-bottom: 2px;
}

li ul{
	padding-left: 10px;
}

table{
	margin-left:auto;
	margin-right:auto;
	margin-top:10px;
	margin-bottom:10px;
	font-weight: lighter;
}

hr{
	border: 1px solid #4f6887;
}


#other-core-members + ul{
	-webkit-column-count: 4;
    -moz-column-count: 4;
    column-count: 4;
    list-style-type:none;
    padding-left: 0;
    margin-left: auto;
    margin-right: auto;
}

#other-core-members + ul > li > p{
	color: #4f6887;
	font-weight: 600;
}

</style>

<body class="home page-template-default page page-id-6 CD2H">
    <jsp:include page="../header.jsp" flush="true" />

    <div class="container pl-0 pr-0">
        <br/> <br/>
        <div class="container-fluid">

            <h1 style="font-size:30px; text-align:center;">CD2H RPPR</h1>
            Jump to:
            <ul> 
                <li><a href="#admin">Administration</a>
                <li><a href="#info_maturity">Informatics Maturity and Best Practices </a>
                <li><a href="#next_gen">Next Generation Data Sharing and Analytics</a>
                <li><a href="#resource_discovery">Resource Discovery</a>
                <li><a href="#cloud">Tools and Cloud Infrastructure</a>
            </ul>
            
            <a name="admin"/>
            <cd2h:RPPRasHTML coreName="admin"/>
            <a name="info_maturity"/>
            <cd2h:RPPRasHTML coreName="informatics-maturity"/>
            <a name="next_gen"/>
            <cd2h:RPPRasHTML coreName="next-gen-data-sharing"/>
            <a name="resource_discovery"/>
            <cd2h:RPPRasHTML coreName="resource-discovery"/>
            <a name="cloud"/>
            <cd2h:RPPRasHTML coreName="software-cloud-infrastructure"/>
         
        </div>
        <jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>

</html>
