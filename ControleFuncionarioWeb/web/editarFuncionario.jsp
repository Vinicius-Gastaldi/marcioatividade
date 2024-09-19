<%@ page import="controlefuncionario.Funcionario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idFuncParam = request.getParameter("idFunc");
    Funcionario funcionario = new Funcionario();
    Funcionario func = null;

    try {
        if (idFuncParam != null) {
            int idFunc = Integer.parseInt(idFuncParam);
            funcionario.setIdFunc(idFunc);
            func = funcionario.consultaFuncionario();
        }
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao carregar dados do funcionário: " + e.getMessage() + "</p>");
    } catch (NumberFormatException e) {
        out.println("<p>ID do funcionário inválido.</p>");
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Funcionário</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Editar Funcionário</h1>
        <% if (func != null) { %>
        <form action="salvarFuncionario.jsp" method="POST">
            <input type="hidden" name="idFunc" value="<%= Integer.parseInt(request.getParameter("idFunc")) %>">
            <div class="form-group">
                <label for="nomeFunc">Nome:</label>
                <input type="text" id="nomeFunc" name="nomeFunc" class="form-control" value="<%= func.getNomeFunc() %>" required>
            </div>
            <div class="form-group">
                <label for="idDepto">ID Departamento:</label>
                <input type="text" id="idDepto" name="idDepto" class="form-control" value="<%= func.getIdDepto() %>" required>
            </div>
            <div class="form-group">
                <label for="salHora">Salário por Hora:</label>
                <input type="text" id="salHora" name="salHora" class="form-control" value="<%= func.getSalHora() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Salvar</button>
            <a href="consultarFuncionario.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
        <% } else { %>
        <p>Funcionário não encontrado.</p>
        <% } %>
    </div>
</body>
</html>

