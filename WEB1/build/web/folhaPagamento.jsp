<%@ page import="controlefuncionario.FolhaPagto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>

<%
    // Inicializa variáveis para manter valores do formulário
    String action = request.getParameter("action");
    String referFolha = request.getParameter("referFolha");
    String idFunc = request.getParameter("idFunc");
    String vlrBruto = request.getParameter("vlrBruto");
    String vlrInss = request.getParameter("vlrInss");
    String vlrLiquido = request.getParameter("vlrLiquido");

    FolhaPagto folhaPagto = new FolhaPagto();
    List<FolhaPagto> listaFolhas = new ArrayList<>();

    // Simular dados de folhas de pagamento para exibição
    // Em uma aplicação real, você deve buscar esses dados do banco de dados
    if ("list".equals(action)) {
        // Simular dados
        folhaPagto.setReferFolha(1);
        folhaPagto.setIdFunc(101);
        folhaPagto.setVlrBruto(2500.00);
        folhaPagto.setVlrInss(250.00);
        folhaPagto.setVlrLiquido(2250.00);
        listaFolhas.add(folhaPagto);
        // Adicione mais dados simulados conforme necessário
    }

    // Se o action for "add", você pode adicionar um novo item à lista
    if ("add".equals(action)) {
        folhaPagto.setReferFolha(Integer.parseInt(referFolha));
        folhaPagto.setIdFunc(Integer.parseInt(idFunc));
        folhaPagto.setVlrBruto(Double.parseDouble(vlrBruto));
        folhaPagto.setVlrInss(Double.parseDouble(vlrInss));
        folhaPagto.setVlrLiquido(Double.parseDouble(vlrLiquido));
        listaFolhas.add(folhaPagto);
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Folhas de Pagamento</title>
</head>
<body>
    <h1>Gerenciar Folhas de Pagamento</h1>

    <form action="folha_pagamento.jsp" method="post">
        <input type="hidden" name="action" value="add">
        <label for="referFolha">Referência da Folha:</label>
        <input type="number" id="referFolha" name="referFolha" required>
        <label for="idFunc">ID do Funcionário:</label>
        <input type="number" id="idFunc" name="idFunc" required>
        <label for="vlrBruto">Valor Bruto:</label>
        <input type="number" id="vlrBruto" name="vlrBruto" step="0.01" required>
        <label for="vlrInss">Valor INSS:</label>
        <input type="number" id="vlrInss" name="vlrInss" step="0.01" required>
        <label for="vlrLiquido">Valor Líquido:</label>
        <input type="number" id="vlrLiquido" name="vlrLiquido" step="0.01" required>
        <input type="submit" value="Adicionar Folha de Pagamento">
    </form>

    <h2>Lista de Folhas de Pagamento</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Referência</th>
                <th>ID Funcionário</th>
                <th>Valor Bruto</th>
                <th>Valor INSS</th>
                <th>Valor Líquido</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (FolhaPagto folha : listaFolhas) {
            %>
            <tr>
                <td><%= folha.getReferFolha() %></td>
                <td><%= folha.getIdFunc() %></td>
                <td><%= folha.getVlrBruto() %></td>
                <td><%= folha.getVlrInss() %></td>
                <td><%= folha.getVlrLiquido() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
