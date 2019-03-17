<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sql:query var="domains" dataSource="jdbc/incite">
    select domain,count(*) from (
                    select institution.domain,seqnum,count(*)
                    from extraction.sentence,jsoup.document,jsoup.institution
                    where sentence.id=document.id and document.did=institution.did and tsv @@ plainto_tsquery(?)
                    group by 1,2
    ) as foo group by domain order by domain;
    <sql:param>${param.term}</sql:param>
</sql:query>

[
    <c:forEach items="${domains.rows}" var="row" varStatus="rowCounter">
        {"element":"${row.domain}","count":${row.count}}<c:if test="${ rowCounter.count < domains.rowCount }">,</c:if>
    </c:forEach>
  ]
