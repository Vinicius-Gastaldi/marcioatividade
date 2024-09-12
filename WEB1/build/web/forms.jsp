<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="POST" action="<%= request.getAttribute("actionURL") %>">
    <label>Nome:</label>
    <input type="text" name="nome" value="<%= request.getAttribute("nome") %>" required><br>
    
    <input type="submit" value="Salvar">
</form>
