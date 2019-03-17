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
                <div style="width: 100%; float: left">
        <c:choose>
        <c:when test="${param.mode == 'org'}">
            <h1>CD2H GitHub Organization</h1>
            <p>These are repositories owned by "data2health". (<a href="repos.jsp">switch to repository view</a>)</p>
            <json:setAPI API="GitHub">
                <json:object queryName="data2health_org" targetName="organization">
                <div style="width: 60%; padding: 0px 0px 0px 0px; float: left">
                <h3>Repositories Owned by data2health</h3>
                <hr>
                    <json:object targetName="repositories">
	                    <json:array label="nodes">
	                        <json:object>
	                            <h4><a href="<json:data label="url"/>"><json:data label="name"/></a></h4>
	                            <p><json:data label="description"/>
	                            <json:object targetName="repositoryTopics">
	                               <ol class="bulletedList">
	                               <json:array label="nodes">
	                                   <json:object>
	                                       <json:object targetName="topic">
	                                           <li><json:data label="name"/>
	                                       </json:object>
	                                   </json:object>
	                               </json:array>
	                               </ol>
	                            </json:object>
                                <json:object targetName="milestones">
                                    <json:array label="nodes">
                                    <c:if test="${json:isFirstArrayElement() == true}">
                                        <table>
                                        <tr><th>Title</th><th>Due On</th><th>Description</th><th>Creator</th></tr>
                                    </c:if>
                                       <json:object>
                                               <tr>
                                                <td><json:data label="title"/></td>
                                                <td><json:data label="dueOn"/></td>
                                                <td><json:data label="description"/></td>
                                                <td><json:object targetName="creator"><a href="https://github.com/<json:data label="login"/>"><json:data label="login"/></a></json:object></td>
                                               </tr>
                                        </json:object>
                                    <c:if test="${json:isLastArrayElement() == true}">
                                     </table>
                                   </c:if>
                                   </json:array>
                               </json:object>
	                        </json:object>
	                    </json:array>
                    </json:object>
                </div>
                <div style="width: 35%; padding: 0px 0px 0px 50px; float: left">
                <h3>Members</h3>
                <hr>
                    <json:object targetName="members">
                    <ol class="bulletedList">
                        <json:array label="nodes">
                            <json:object>
                                <li><img align="top" width="40px" src="<json:data label="avatarUrl"/>"> <b><json:data label="name"/></b>
                                    (<a href="https://github.com/<json:data label="login"/>"><json:data label="login"/></a>)
                                    <json:data label="bio"/>
                            </json:object>
                        </json:array>
                    </ol>
                    </json:object>
                </div>
                </json:object>
            </json:setAPI>
        </c:when>
        <c:otherwise>
            <h1>CD2H GitHub Repositories</h1>
            <p>These are repositories flagged with "data2health" as a topic. (<a href="repos.jsp?mode=org">switch to organization view</a>)</p>
            <json:setAPI API="GitHub">
                <json:object queryName="data2health_tagged_repos" targetName="search">
                    Repository Count: <json:data label="repositoryCount"/>
                    <hr>
                    <json:array label="edges">
                        <json:object targetName="node">
                            <c:set var="owner"><json:object targetName="owner"><json:data label="login"/></json:object></c:set>
                            <h4><a href="https://github.com/${owner}/<json:data label="name"/>"><json:data label="name"/></a> (${owner})</h4>
                            <p><json:data label="description"/></p>
                            <p>
                        </json:object>
                    </json:array>
                </json:object>
            </json:setAPI>
        </c:otherwise>
        </c:choose>
        </div>
            <div style="width: 100%; float: left">
                <jsp:include page="../footer.jsp" flush="true" />
            </div>
            </div>
            </div>
</body>

</html>
