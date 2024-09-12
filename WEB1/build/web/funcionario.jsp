<%@ page import="controlefuncionario.Funcionario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>

<%
    // Inicializa variáveis para manter valores do formulário
    String action = request.getParameter("action");
    String idFunc = request.getParameter("idFunc");
    String nomeFunc = request.getParameter("nomeFunc");
    String idDepto = request.getParameter("idDepto");
    String salHora = request.getParameter("salHora");

    Funcionario funcionario = new Funcionario();
    List<Funcionario> listaFuncionarios = new ArrayList<>();

    // Simular dados de funcionários para exibição
    // Em uma aplicação real, você deve buscar esses dados do banco de dados
    if ("list".equals(action)) {
        // Simular dados
        funcionario.setIdFunc(1);
        funcionario.setNomeFunc("João da Silva");
        funcionario.setIdDepto(10);
        funcionario.setSalHora(20.00);
        listaFuncionarios.add(funcionario);
        // Adicione mais dados simulados conforme necessário
    }

    // Se o action for "add", você pode adicionar um novo item à lista
    if ("add".equals(action)) {
        funcionario.setIdFunc(Integer.parseInt(idFunc));
        funcionario.setNomeFunc(nomeFunc);
        funcionario.setIdDepto(Integer.parseInt(idDepto));
        funcionario.setSalHora(Double.parseDouble(salHora));
        listaFuncionarios.add(funcionario);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Funcionários</title>
</head>
<body>
    <h1>Gerenciar Funcionários</h1>

    <form action="funcionario.jsp" method="post">
        <input type="hidden" name="action" value="add">
        <label for="idFunc">ID Funcionário:</label>
        <input type="number" id="idFunc" name="idFunc" required>
        <label for="nomeFunc">Nome:</label>
        <input type="text" id="nomeFunc" name="nomeFunc" required>
        <label for="idDepto">ID do Departamento:</label>
        <input type="number" id="idDepto" name="idDepto" required>
        <label for="salHora">Salário por Hora:</label>
        <input type="number" id="salHora" name="salHora" step="0.01" required>
        <input type="submit" value="Adicionar Funcionário">
    </form>

    <h2>Lista de Funcionários</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID Funcionário</th>
                <th>Nome</th>
                <th>ID Departamento</th>
                <th>Salário por Hora</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Funcionario func : listaFuncionarios) {
            %>
            <tr>
                <td><%= func.getIdFunc() %></td>
                <td><%= func.getNomeFunc() %></td>
                <td><%= func.getIdDepto() %></td>
                <td><%= func.getSalHora() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
