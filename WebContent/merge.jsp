<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<sql:update dataSource="jdbc/VIVOTagLib">
	insert into cd2h_phase2.merge(target,merged) values(?::int,?::int)
	<sql:param>${param.target}</sql:param>
	<sql:param>${param.merged}</sql:param>
</sql:update>

<c:redirect url="mergers.jsp" />
