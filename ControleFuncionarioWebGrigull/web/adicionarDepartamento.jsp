<%-- 
    Document   : adicionarDepartamento
    Created on : 14 de set. de 2024, 21:43:59
    Author     : Samsung
--%>

<%@page import="controlefuncionario.Departamento"%>
<%
    String descDepto =  request.getParameter("descDepto");
    
    Departamento Depto = new Departamento();
    Depto.setDescDepto(descDepto);
    
    Depto.incluirDepartamento();
    
    response.sendRedirect("Departamento.html");




%>