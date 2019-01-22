<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<sql:update dataSource="jdbc/loki">
	delete from cd2h_phase2.merge where target = ?::int and merged = ?::int
	<sql:param>${param.target}</sql:param>
	<sql:param>${param.merged}</sql:param>
</sql:update>

<c:redirect url="mergers.jsp" />
