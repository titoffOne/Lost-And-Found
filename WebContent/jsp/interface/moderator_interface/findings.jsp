<%@page import="datalayer.data.Finding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="datalayer.data.Finding"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<!DOCTYPE html>



<html>
<head>
<meta charset="UTF-8">
		<style>
			<jsp:include page="./styles.css"/>
		</style>
</head>

<body>
	<jsp:include page="/jsp/interface/moderator_interface/header.jsp" />

<div class="content">
	<% List<Finding> foundItems = (List<Finding>) request.getAttribute("foundItems");
     for (Finding finding : foundItems) { %>


	<table item="finding" width="90%">
		<tr>
			<td item="category"><%= finding.getCategory() %></td>
			<td item="description" rowspan="4"><%= finding.getDescription() %></td>
			<td rowspan="4">
					<div style="display: flex;">
						<form name="ChangeButton" method="POST" action="findings/changefinding">
							<input type="hidden" name="command" value="changefinding" /> 
							<input type="hidden" name="client" value="moderator" />
							<input type="hidden" name="findingid" value="<%= finding.getId()%>" />
							<button item="actionbutton" type="submit" name="action"
							value="changefinding">Изменить</button>
						</form>
						<form name="QuestionsButton" method="POST" action="findings/controlquestions">
							<input type="hidden" name="command" value="controlquestions" />
							<input type="hidden" name="client" value="moderator" />
							<input type="hidden" name="findingid" value="<%= finding.getId() %>" />
							<button item="actionbutton" type="submit" name="action"
								value="show">Контрольные<br>вопросы</button>
						</form>
					</div>
				</td>
		</tr>
		<tr>
			<td item="date"><%= finding.getDate() %></td>
		</tr>
		<tr>
			<td item="name"><%= finding.getName() %></td>
		</tr>
		<tr>
			<td item="place"><%= finding.getPlace() %></td>
		</tr>
	</table>

	<% } %>
</div>
<jsp:include page="/jsp/interface/moderator_interface/footer.jsp" />
</body>
</html>