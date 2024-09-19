<%-- 
    Document   : consultarFuncionario
    Created on : 16 de set. de 2024, 09:03:29
    Author     : vinicius_gastaldi
--%>

<%@ page import="controlefuncionario.Funcionario" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Funcionario funcionario = new Funcionario();
    List<Funcionario> funcionarios = null;

    try {
        funcionarios = funcionario.listarFuncionarios();
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao carregar funcionários: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<!-- Página de Lista de Funcionários (consultarFuncionario.jsp) -->
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Funcionários</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <% if (funcionarios != null && !funcionarios.isEmpty()) { %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>ID Departamento</th>
                    <th>Salário por Hora</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Funcionario func : funcionarios) { %>
                <tr>
                    <td><%= func.getIdFunc() %></td>
                    <td><%= func.getNomeFunc() %></td>
                    <td><%= func.getIdDepto() %></td>
                    <td><%= func.getSalHora() %></td>
                    <td>
                        <!-- Link para editar funcionário -->
                        <a href="editarFuncionario.jsp?idFunc=<%= func.getIdFunc() %>" class="btn btn-warning">Editar</a>
                        <!-- Formulário para excluir funcionário -->
                        <form action="excluirFuncionario.jsp" method="POST" style="display:inline-block;">
                            <input type="hidden" name="idFunc" value="<%= func.getIdFunc() %>">
                            <button type="submit" class="btn btn-danger">Excluir</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>Nenhum funcionário encontrado.</p>
        <% } %>
    </div>
</body>
</html>

