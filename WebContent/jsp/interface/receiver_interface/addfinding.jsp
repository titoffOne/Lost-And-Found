<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="datalayer.data.Finding" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <style>
        <jsp:include page="./styles.css" />
    </style>
    <title>Добавление находки</title>
</head>
<body>
	
	<h1>Добавление находки</h1>
	
    <div class="changefinding">
        <form id="changefindingForm" name="changefindingForm" method="POST" action="/Lost-And-Found/findings" accept-charset="UTF-8">
            <input type="hidden" name="client" value="receiver" />
            <input type="hidden" name="command" value="refreshFindings" />
            <input type="hidden" name="act" value="add" />
            
            <!-- Наименование находки -->
            <label for="findingName">Наименование находки:</label>
            <input id="findingName" type="text" required name="findingName" value="" /><br />

            <!-- Описание находки -->
            <label for="findingDescription">Описание находки:</label>
            <textarea id="findingDescription" required name="findingDescription"></textarea><br />

            <!-- Дата находки -->
            <label for="findingDate">Дата находки:</label>
            <input id="findingDate" type="date" required name="findingDate" value="" /><br />

            <!-- Место находки -->
            <label for="findingLocation">Место находки:</label>
            <input id="findingLocation" type="text" required name="findingLocation" value="" /><br />

            <!-- Категория находки -->
            <label for="findingCategory">Категория находки:</label>
            <select id="findingCategory" name="findingCategory">
                <option value="Драгоценности и ювелирные изделия" >Драгоценности и ювелирные изделия</option>
                <option value="Личные вещи">Личные вещи</option>
                <option value="Технические устройства">Технические устройства</option>
            </select><br />

            <button id="saveFindingChanges" type="submit">Добавить находку</button>
        </form>
    </div>

    <jsp:include page="/jsp/interface/receiver_interface/footer.jsp" />

</body>
</html>
