<%@ page import="controlefuncionario.Funcionario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idFuncParam = request.getParameter("idFunc");
    String nomeFunc = request.getParameter("nomeFunc");
    String idDeptoParam = request.getParameter("idDepto");
    String salHoraParam = request.getParameter("salHora");

    Funcionario funcionario = new Funcionario();

    try {
        if (idFuncParam != null && nomeFunc != null && idDeptoParam != null && salHoraParam != null) {
            int idFunc = Integer.parseInt(idFuncParam);
            int idDepto = Integer.parseInt(idDeptoParam);
            double salHora = Double.parseDouble(salHoraParam);

            funcionario.setIdFunc(idFunc);
            funcionario.setNomeFunc(nomeFunc);
            funcionario.setIdDepto(idDepto);
            funcionario.setSalHora(salHora);

            // Chama o método para alterar o funcionário
            if (funcionario.alterarFuncionario()) {
                response.sendRedirect("consultarFuncionario.jsp"); // Redireciona após a atualização
            } else {
                out.println("<p>Erro ao atualizar o funcionário.</p>");
            }
        } else {
            out.println("<p>ID, nome, ID do departamento ou salário não fornecidos.</p>");
        }
    } catch (ClassNotFoundException e) {
        out.println("<p>Erro ao atualizar funcionário: " + e.getMessage() + "</p>");
    } catch (NumberFormatException e) {
        out.println("<p>Erro de formato de número: " + e.getMessage() + "</p>");
    }
%>
