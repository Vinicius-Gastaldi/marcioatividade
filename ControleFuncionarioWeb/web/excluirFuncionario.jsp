<%-- 
    Document   : excluirFuncionario
    Created on : 16 de set. de 2024, 09:06:55
    Author     : vinicius_gastaldi
--%>

<%@page import="controlefuncionario.Funcionario"%>
<%
    String stringIdFunc = request.getParameter("idFunc");
    
    // Converte o ID do funcion�rio de String para int
    int idFunc = Integer.parseInt(stringIdFunc);
    
    // Cria uma inst�ncia de Funcionario e define o ID
    Funcionario func = new Funcionario();
    func.setIdFunc(idFunc);
    
    // Exclui o funcion�rio
    func.excluirFuncionario();
    
    // Redireciona para a p�gina de consulta de funcion�rios ap�s exclus�o
    response.sendRedirect("consultarFuncionario.jsp");
%>

