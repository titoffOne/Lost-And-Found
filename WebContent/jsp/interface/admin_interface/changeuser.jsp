<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="datalayer.data.SystemUser"%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<style>
	<jsp:include page="./styles.css"/>
</style>
<title>Insert title here</title>
</head>
<body>
  <% SystemUser user = (SystemUser)request.getAttribute("user"); %>
<div class="adduser">
<form id="addUserForm" name="addUserForm" method="POST" action="/Lost-And-Found/users" accept-charset="UTF-8">
	<input type="hidden" name="client" value="admin" />
	<input type="hidden" name="command" value="refreshUsers" />
	<input type="hidden" name="act" value="change" />
	<input type="hidden" name="userid" value="<%=user.getUserID()%>" />  
    <!-- ФИО -->
    <label for="fullName">ФИО:</label>
    <input id="fullName" type="text" required name="fullName" value="<%= user.getFullName() %>" /><br />

    <!-- Номер телефона (начинается с +7) -->
    <label for="phoneNumber">Номер телефона:</label>
    <input id="phoneNumber" type="text" required name="phoneNumber" pattern="^\+7\d{10}$" placeholder="+79991234567" value = "<%= user.getPhone() %>" /><br />

    <!-- Email -->
    <label for="email">Email:</label>
    <input id="email" type="email" required name="email" value="<%= user.getEmail() %>" /><br />

    <!-- Логин -->
    <label for="login">Логин:</label>
    <input id="login" type="text" required name="login" value="<%= user.getLogin() %>" /><br />

    <!-- Пароль -->
    <label for="password">Пароль:</label>
    <input id="password" type="password" required name="password" value="<%= user.getPassword()%>" /><br />

    <!-- Статус -->
<label for="status">Статус:</label>
<select id="status" name="status">
    <option value="Активен" <% if (user.getStatus().equals("Активен")) { %>selected<% } %>>Активен</option>
    <option value="Заблокирован" <% if (user.getStatus().equals("Заблокирован")) { %>selected<% } %>>Заблокирован</option>
</select><br />
    <!-- Группа -->
    <label for="group">Группа:</label>
    <select id="group" name="group">
         <option value="Администратор" <% if (user.getGroup().equals("Администратор")) { %>selected<% } %>>Администратор</option>
        <option value="Модератор" <% if (user.getGroup().equals("Модератор")) { %>selected<% } %>>Модератор</option>
        <option value="Клиент" <% if (user.getGroup().equals("Клиент")) { %>selected<% } %>>Клиент</option>
        <option value="Приемщик" <% if (user.getGroup().equals("Приемщик")) { %>selected<% } %>>Приемщик</option>
    </select><br />
	<button item="actionbutton" type="submit">Сохранить изменения</button>
    <!-- <input id="loginbutton" type="submit" value="Добавить пользователя" /> -->
</form>
</div>

<jsp:include page="/jsp/interface/admin_interface/footer.jsp" />

</body>
</html>