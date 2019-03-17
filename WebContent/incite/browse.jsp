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

			<h1>CTSA Website Exploration</h1>
			Enter a term of interest and click submit:
			<form action="browse.jsp">
				<input name="term" value="${param.term}" size=50> <input
					type=submit name=submitButton value=Search>
			</form>
			<c:if test="${not empty param.term}">
				<p><p>
				<h3>${param.term}</h3>
				<div id="contentBlock">
<div id="contentBlock2">
Number of distinct sentences mentioning ${param.term} in CTSA hub websites
<div id="graph" align="left"></div>
                <jsp:include page="../graphs/verticalBarChart.jsp">
                    <jsp:param name="data_page" value="termData.jsp?term=${param.term}" />
                    <jsp:param name="dom_element" value="#graph" />
                </jsp:include>
</div>
<div id="contentBlock2">
    			<sql:query var="proposals" dataSource="jdbc/incite">
                    select institution.domain,sentence,count(*)
                    from extraction.sentence,jsoup.document,jsoup.institution
                    where sentence.id=document.id and document.did=institution.did and sentence~?
                    group by 1,2 order by 1,3 desc;
                    <sql:param>${param.term}</sql:param>
                 </sql:query>
                 <table>
                    <caption>Sentences Appearing on CTSA Hub Websites</caption>
                    <tr><th>Domain Name</th><th>Distinct Sentence</th><th># of Occurrences on Site</th></tr>
				<c:forEach items="${proposals.rows}" var="row">
                   <tr><td>${row.domain}</td><td>${row.sentence}</td><td>${row.count}</td></tr>
				</c:forEach>
                </table>
</div>  
</div>  
			</c:if>
		</div>
</div>

</body>

</html>
