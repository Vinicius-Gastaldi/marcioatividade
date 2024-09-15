<%-- 
    Document   : excluirDepartamento
    Created on : 14 de set. de 2024, 23:05:48
    Author     : Samsung
--%>

<%@page import="controlefuncionario.Departamento"%>
<%
    
    String StringIdDepto =  request.getParameter("idDepto");
    int idDepto = Integer.parseInt(StringIdDepto);
    
    Departamento Depto = new Departamento();
    Depto.setIdDepto(idDepto);
    
    Depto.excluirDepartamento();
    
    response.sendRedirect("consultarDepartamento.jsp");




%>
