<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<div class="container">
	<div class="jumbotron">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="col-lg-2">航空公司</span>&nbsp;
					<span class="col-lg-2">出发地</span>&nbsp;
					<span class="col-lg-2">目的地</span>&nbsp;
					<span class="col-lg-2">出发时间</span>&nbsp;
				</h3>
			</div>
			<div class="panel-body">
				<c:if test="${not empty orders}">
					<ul class="list-group">
						<c:forEach var="listValue" items="${orders}">
							<li class="list-group-item"><span class="col-lg-2">${listValue.flight_name}</span>&nbsp;
								<span class="col-lg-2">${listValue.from_city}</span>&nbsp; <span
								class="col-lg-2">${listValue.to_city}</span>&nbsp; <span
								class="col-lg-4">${listValue.departing}</span>&nbsp;</li>
						</c:forEach>
					</ul>

				</c:if>
			</div>
		</div>

	</div>
	<script>
		
	</script>
</div>
<%@ include file="footer.jsp"%>
