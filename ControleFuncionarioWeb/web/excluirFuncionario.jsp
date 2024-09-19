<%-- 
    Document   : excluirFuncionario
    Created on : 16 de set. de 2024, 09:06:55
    Author     : vinicius_gastaldi
--%>

<%@page import="controlefuncionario.Funcionario"%>
<%
    String stringIdFunc = request.getParameter("idFunc");
    
    // Converte o ID do funcionário de String para int
    int idFunc = Integer.parseInt(stringIdFunc);
    
    // Cria uma instância de Funcionario e define o ID
    Funcionario func = new Funcionario();
    func.setIdFunc(idFunc);
    
    // Exclui o funcionário
    func.excluirFuncionario();
    
    // Redireciona para a página de consulta de funcionários após exclusão
    response.sendRedirect("consultarFuncionario.jsp");
%>

