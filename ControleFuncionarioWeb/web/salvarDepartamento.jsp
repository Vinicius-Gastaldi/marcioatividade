<%-- 
    Document   : salvarDepartamento
    Created on : 15 de set. de 2024, 01:38:23
    Author     : Samsung
--%>

<%@ page import="controlefuncionario.Departamento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idDeptoParam = request.getParameter("idDepto");
    String descDepto = request.getParameter("descDepto");
    Departamento departamento = new Departamento();

    try {
        if (idDeptoParam != null && descDepto != null) {
            int idDepto = Integer.parseInt(idDeptoParam);
            departamento.setIdDepto(idDepto);
            departamento.setDescDepto(descDepto);

            // Chama o método para alterar o departamento
            if (departamento.alterarDepartamento()) {
                response.sendRedirect("consultarDepartamento.jsp"); // Redireciona após a atualização
            } else {
                out.println("<p>Erro ao atualizar o departamento.</p>");
            }
        } else {
            out.println("<p>ID ou descrição do departamento não fornecidos.</p>");
        }
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao atualizar departamento: " + e.getMessage() + "</p>");
    } catch (NumberFormatException e) {
        out.println("<p>ID do departamento inválido.</p>");
    }
%>

