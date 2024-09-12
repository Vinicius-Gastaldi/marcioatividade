<%@ page import="controlefuncionario.Departamento" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>


<%
    // Inicializa variáveis para manter valores do formulário
    String action = request.getParameter("action");
    String idDepto = request.getParameter("idDepto");
    String descDepto = request.getParameter("descDepto");

    Departamento departamento = new Departamento();

    // Operação de inclusão
    if ("add".equals(action)) {
        departamento.setDescDepto(descDepto);
        try {
            departamento.incluirDepartamento();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Operação de alteração
    if ("edit".equals(action) && idDepto != null) {
        departamento.setIdDepto(Integer.parseInt(idDepto));
        departamento.setDescDepto(descDepto);
        try {
            departamento.alterarDepartamento();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Operação de exclusão
    if ("delete".equals(action) && idDepto != null) {
        departamento.setIdDepto(Integer.parseInt(idDepto));
        try {
            departamento.excluirDepartamento();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Listar os departamentos
    List<Departamento> listaDeptos = null;
    try {
        listaDeptos = departamento.listarDeptos();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link rel="stylesheet" href="Styles/styles.css">
    <title>Gerenciar Departamentos</title>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <h1>Gerenciar Departamentos</h1>

    <form action="departamento.jsp" method="post">
        <input type="hidden" name="action" value="add">
        <label for="descDepto">Descrição do Departamento:</label>
        <input type="text" id="descDepto" name="descDepto" required>
        <input type="submit" value="Adicionar Departamento">
        
    </form>

    <h2>Lista de Departamentos</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (listaDeptos != null) {
                    for (Departamento depto : listaDeptos) {
            %>
            <tr>
                <td><%= depto.getIdDepto() %></td>
                <td><%= depto.getDescDepto() %></td>
                <td>
                    <form action="departamento.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="idDepto" value="<%= depto.getIdDepto() %>">
                        <input type="hidden" name="action" value="delete">
                        <input type="submit" value="Excluir" onclick="return confirm('Tem certeza que deseja excluir?');">
                    </form>

                    <form action="departamento.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="idDepto" value="<%= depto.getIdDepto() %>">
                        <input type="text" name="descDepto" value="<%= depto.getDescDepto() %>" required>
                        <input type="hidden" name="action" value="edit">
                        <input type="submit" value="Editar">
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <jsp:include page="footer.jsp" />
</body>
</html>
