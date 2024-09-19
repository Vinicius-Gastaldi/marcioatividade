<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle de Funcionarios</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilos/style.css"> <!-- Inclua o arquivo CSS da barra lateral -->
</head>
<body>
    <!-- partial:index.partial.html -->
    <header>
    <% 
        String email = (String) session.getAttribute("usuario");
        if (email == null) {
            response.sendRedirect("usuarioNaoLogado.html");
            return;
        }
    %>
        <nav class="navbar navbar-expand navbar-dark bg-primary">
            <div class="container-fluid">
                <a href="#menu-toggle" id="menu-toggle" class="navbar-brand">
                    <span class="navbar-toggler-icon"></span>
                </a>   
                <div class="sidebar-brand">
                    <a href="menu.jsp">Controle Funcionário</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExample02">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="menu.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-md-0"> </form>
                </div>
            </div>
        </nav>
    </header>

    <div id="wrapper" class="toggled">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li><a href="Departamento.jsp">Departamento</a></li>
                <li><a href="Funcionario.jsp">Funcionário</a></li>
                <li><a href="#">Usuário</a></li>
                <li><a href="#">Folha de Pagamento</a></li>
            </ul>
        </div> <!-- /#sidebar-wrapper -->
                <!-- Page Content -->
        <div id="page-content-wrapper">
    <div class="container mt-5">
        <h1>Adicionar Novo Funcionário</h1>
        <form action="adicionarFuncionario.jsp" method="POST">
            <div class="form-group">
                <label for="nomeFunc">Nome do Funcionário:</label>
                <input type="text" id="nomeFunc" name="nomeFunc" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="idDepto">ID do Departamento:</label>
                <input type="number" id="idDepto" name="idDepto" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="salHora">Salário por Hora:</label>
                <input type="number" step="0.01" id="salHora" name="salHora" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Adicionar</button>
        </form>
    </div>
                <div class="container mt-5">
                <h1>Consulta de Funcionarios</h1>
                <!-- Exibe apenas a tabela de listagem dos funcionarios, sem o formulário -->
                <iframe src="consultarFuncionario.jsp" width="100%" height="400" style="border: none;"></iframe>
            </div>
        </div> <!-- /#page-content-wrapper -->
    </div> <!-- /#wrapper -->

    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js'></script>
    <script src="scripts/script.js"></script>
</body>
</html>
