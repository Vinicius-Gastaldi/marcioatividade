<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Sistema de Gestão</title>
    <link rel="stylesheet" href="Styles/styles.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <h1>Sistema de Gestão de Departamento e Funcionários</h1>
    
    <div>
        <a href="Departamento.jsp">Gerenciar Departamentos</a><br>
        <a href="funcionario.jsp">Gerenciar Funcionários</a><br>
        <a href="folhaPagamento.jsp">Gerenciar Folhas de Pagamento</a><br>
        <a href="usuario.jsp">Gerenciar Usuários</a><br>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
