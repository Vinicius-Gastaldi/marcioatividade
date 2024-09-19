<%-- 
    Document   : adicionarFuncionario
    Created on : 16 de set. de 2024, 08:46:26
    Author     : vinicius_gastaldi
--%>

<%@page import="controlefuncionario.Funcionario"%>
<%
    String nomeFunc = request.getParameter("nomeFunc");
    int idDepto = Integer.parseInt(request.getParameter("idDepto"));
    double salHora = Double.parseDouble(request.getParameter("salHora"));

    Funcionario Func = new Funcionario();
    Func.setNomeFunc(nomeFunc);
    Func.setIdDepto(idDepto);
    Func.setSalHora(salHora);

    Func.incluirFuncionario();

    response.sendRedirect("Funcionario.jsp");
%>
