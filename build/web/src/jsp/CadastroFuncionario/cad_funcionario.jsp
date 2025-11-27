<%-- 
    Document   : cad_funcionario
    Created on : 25 de nov. de 2025, 14:48:56
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Funcionario" %>
<%@page import="ModelDAO.FuncionarioDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Funcionário</title>

        <!-- CSS -->
        <link rel="stylesheet" href="../../css/variables.css"/>
        <link rel="stylesheet" href="../../css/reset.css"/>
        <link rel="stylesheet" href="../../css/main.css"/>
        <link rel="stylesheet" href="../../css/modal.css"/>
    </head>
    <body>
        <div class="modal__cadastro">
            <h1>Cadastro de Cliente</h1>
            <%
                // Instância do Objeto
                Funcionario funcionario = new Funcionario();

                funcionario.setNome(request.getParameter("nome"));
                funcionario.setCPF(request.getParameter("cpf"));
                funcionario.setEmail(request.getParameter("email"));
                funcionario.setTelefone(request.getParameter("telefone"));

                //Gravar...
                FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
                if (funcionarioDAO.cadastrar(funcionario)) {
                    out.println("<p>Funcionário cadastrado com sucesso!</p>");
                    
                    response.setHeader("Refresh", "2; URL=Funcionarios.jsp");
                } else {
                    out.println("<p>Funcionário não cadastrado!</p>");
                }
            %>
            <div class="modal__bttn__container">
                <a class="bttn" href="../../html/CadastroFuncionario.html">Cadastrar outro Funcionário</a>
                <a class="bttn" href="Funcionarios.jsp">Voltar</a>
            </div>
        </div>
    </body>
</html>
