<%@ page import="controlefuncionario.Funcionario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>

<%
    // Inicializa vari�veis para manter valores do formul�rio
    String action = request.getParameter("action");
    String idFunc = request.getParameter("idFunc");
    String nomeFunc = request.getParameter("nomeFunc");
    String idDepto = request.getParameter("idDepto");
    String salHora = request.getParameter("salHora");

    Funcionario funcionario = new Funcionario();
    List<Funcionario> listaFuncionarios = new ArrayList<>();

    // Simular dados de funcion�rios para exibi��o
    // Em uma aplica��o real, voc� deve buscar esses dados do banco de dados
    if ("list".equals(action)) {
        // Simular dados
        funcionario.setIdFunc(1);
        funcionario.setNomeFunc("Jo�o da Silva");
        funcionario.setIdDepto(10);
        funcionario.setSalHora(20.00);
        listaFuncionarios.add(funcionario);
        // Adicione mais dados simulados conforme necess�rio
    }

    // Se o action for "add", voc� pode adicionar um novo item � lista
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
    <title>Gerenciar Funcion�rios</title>
</head>
<body>
    <h1>Gerenciar Funcion�rios</h1>

    <form action="funcionario.jsp" method="post">
        <input type="hidden" name="action" value="add">
        <label for="idFunc">ID Funcion�rio:</label>
        <input type="number" id="idFunc" name="idFunc" required>
        <label for="nomeFunc">Nome:</label>
        <input type="text" id="nomeFunc" name="nomeFunc" required>
        <label for="idDepto">ID do Departamento:</label>
        <input type="number" id="idDepto" name="idDepto" required>
        <label for="salHora">Sal�rio por Hora:</label>
        <input type="number" id="salHora" name="salHora" step="0.01" required>
        <input type="submit" value="Adicionar Funcion�rio">
    </form>

    <h2>Lista de Funcion�rios</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID Funcion�rio</th>
                <th>Nome</th>
                <th>ID Departamento</th>
                <th>Sal�rio por Hora</th>
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
