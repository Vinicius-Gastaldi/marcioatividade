<%@ page import="controlefuncionario.Departamento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idDeptoParam = request.getParameter("idDepto");
    Departamento departamento = new Departamento();
    Departamento depto = null;

    try {
        if (idDeptoParam != null) {
            int idDepto = Integer.parseInt(idDeptoParam);
            departamento.setIdDepto(idDepto);
            depto = departamento.consultaDepto();
        }
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao carregar dados do departamento: " + e.getMessage() + "</p>");
    } catch (NumberFormatException e) {
        out.println("<p>ID do departamento inválido.</p>");
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Departamento</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Editar Departamento</h1>
        <% if (depto != null) { %>
        <form action="salvarDepartamento.jsp" method="POST">
            <input type="hidden" name="idDepto" value="<%= depto.getIdDepto() %>">
            <div class="form-group">
                <label for="descDepto">Descrição:</label>
                <input type="text" id="descDepto" name="descDepto" class="form-control" value="<%= depto.getDescDepto() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Salvar</button>
            <a href="consultarDepartamento.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
        <% } else { %>
        <p>Departamento não encontrado.</p>
        <% } %>
    </div>
</body>
</html>
