<!-- Página de Lista de Departamentos (consultarDepartamento.jsp) -->
<%@ page import="controlefuncionario.Departamento" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Departamento departamento = new Departamento();
    List<Departamento> departamentos = null;

    try {
        departamentos = departamento.listarDeptos();
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao carregar departamentos: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Departamentos</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <% if (departamentos != null && !departamentos.isEmpty()) { %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descrição</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Departamento depto : departamentos) { %>
                <tr>
                    <td><%= depto.getIdDepto() %></td>
                    <td><%= depto.getDescDepto() %></td>
                    <td>
                        <!-- Link para editar departamento -->
                        <a href="editarDepartamento.jsp?idDepto=<%= depto.getIdDepto() %>" class="btn btn-warning">Editar</a>
                        <!-- Formulário para excluir departamento -->
                        <form action="excluirDepartamento.jsp" method="POST" style="display:inline-block;">
                            <input type="hidden" name="idDepto" value="<%= depto.getIdDepto() %>">
                            <button type="submit" class="btn btn-danger">Excluir</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Nenhum departamento encontrado.</p>
        <% } %>
    </div>
</body>
</html>
