<%-- 
    Document   : AlterarDadosFuncionario
    Created on : 25 de nov. de 2025, 14:30:01
    Author     : ramon
--%>

<%@page import="Model.Funcionario" %>
<%@page import="ModelDAO.FuncionarioDAO"%>
<%@page import="java.lang.Integer" %>

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
        <link rel="stylesheet" href="../../css/forms.css"/>
    </head>
    <body>
        <%
            // 1. Variáveis e Lógica de Busca

            // Resgata o ID da URL (parâmetro GET)
            String idString = request.getParameter("id");
            int idFuncionario = 0;
            Funcionario funcionarioParaEdicao = null;

            try {
                idFuncionario = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                out.println("<h1>Erro: ID do funcionário inválido.</h1>");
                return;
            }

            FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
            funcionarioParaEdicao = funcionarioDAO.consulta_id(idFuncionario);

            // Verifica se o Funcionário foi encontrado
            if (funcionarioParaEdicao == null) {
                out.println("<h1>Erro: Funcionário não encontrado no banco de dados.</h1>");
                return;
            }
        %>

        <main class="content">
            <header class="page_header descInfo">
                <h1>Alterar Dados do Funcionário</h1>

                <p><span>Editar Funcionário:</span> <%= funcionarioParaEdicao.getNome()%></p>
                <hr>
            </header>

            <form class="cad__form" method="POST" action="alt_funcionario.jsp" id="form">
                <input type="hidden" name="id" value="<%= funcionarioParaEdicao.getId()%>">

                <div class="input__container">
                    <label for="nome">Nome</label>
                    <input class="input" type="text" name="nome" id="nome" value="<%= funcionarioParaEdicao.getNome()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="cpf">CPF</label>
                    <input class="input" type="text" name="cpf" id="cpf" value="<%= funcionarioParaEdicao.getCPF()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="email">Email</label>
                    <input class="input" type="email" name="email" id="email" value="<%= funcionarioParaEdicao.getEmail()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="telefone">Telefone</label>
                    <input class="input" type="text" name="telefone" id="telefone" value="<%= funcionarioParaEdicao.getTelefone()%>"/>
                    <p class="data_error"></p>
                </div>

                <input class="sbmt__bttn" type="submit" value="Salvar" />
            </form>
        </main>

        <script type="text/javascript" src="../../js/manageForm_Funcionarios.js"></script>
    </body>
</html>
