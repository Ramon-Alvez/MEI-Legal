<%-- 
    Document   : alt_funcionario
    Created on : 25 de nov. de 2025, 16:49:13
    Author     : ramon
--%>


<%@page import="java.util.*"%>
<%@page import="Model.Funcionario" %>
<%@page import="ModelDAO.FuncionarioDAO"%>
<%@page import="java.lang.Integer"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados do Funcionário</title>

        <!-- CSS -->
        <link rel="stylesheet" href="../../css/variables.css"/>
        <link rel="stylesheet" href="../../css/reset.css"/>
        <link rel="stylesheet" href="../../css/main.css"/>
        <link rel="stylesheet" href="../../css/modal.css"/>
    </head>
    <body>
        <div class="modal__cadastro"> 
            <h1>Resultado</h1>
            <%
                Funcionario funcionario = new Funcionario();

                String idString = request.getParameter("id");
                
                try {
                    int idFuncionario = Integer.parseInt(idString);
                    funcionario.setId(idFuncionario);
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                    return;
                }

                // Resgatando os Dados atualizados do Formulário
                funcionario.setNome(request.getParameter("nome"));
                funcionario.setCPF(request.getParameter("cpf"));
                funcionario.setEmail(request.getParameter("email"));
                funcionario.setTelefone(request.getParameter("telefone"));


                /* Alteração */
                FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
                boolean sucesso = false;

                try {
                    sucesso = funcionarioDAO.alterar(funcionario);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Dados alterados com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Funcionarios.jsp");
                } else {
                    out.println("<p>O Funcionario não pôde ser alterado. Tente novamente.</p>");
                }
            %>
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Funcionarios.jsp">Voltar para a Tabela</a>
            </div>
        </div>
    </body>
</html>
