<%-- 
    Document   : AlterarDadosFornecedor
    Created on : 25 de nov. de 2025, 21:26:53
    Author     : ramon
--%>

<%@page import="Model.Fornecedor" %>
<%@page import="ModelDAO.FornecedorDAO"%>
<%@page import="java.lang.Integer" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados do Fornecedor</title>

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
            int idFornecedor = 0;
            Fornecedor fornecedorParaEdicao = null;

            try {
                idFornecedor = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                out.println("<h1>Erro: ID do funcionário inválido.</h1>");
                return;
            }

            FornecedorDAO fornecedorDAO = new FornecedorDAO();
            fornecedorParaEdicao = fornecedorDAO.consulta_id(idFornecedor);

            // Verifica se o Funcionário foi encontrado
            if (fornecedorParaEdicao == null) {
                out.println("<h1>Erro: Fornecedor não encontrado no banco de dados.</h1>");
                return;
            }
        %>

        <main class="content">
            <header class="page_header descInfo">
                <h1>Alterar Dados do Fornecedor</h1>

                <p><span>Editar Fornecedor:</span> <%= fornecedorParaEdicao.getRazaoSocial()%></p>
                <hr>
            </header>

                <form class="cad__form" method="POST" action="alt_fornecedor.jsp" id="form">
                <input type="hidden" name="id" value="<%= fornecedorParaEdicao.getId()%>">

                <div class="input__container">
                    <label for="razaoSocial">Razão Social</label>
                    <input class="input" type="text" name="razaoSocial" id="razaoSocial" value="<%= fornecedorParaEdicao.getRazaoSocial()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="cnpj">CNPJ</label>
                    <input class="input" type="text" name="cnpj" id="cnpj" value="<%= fornecedorParaEdicao.getCNPJ()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="servico">Serviços Prestados</label>
                    <input class="input" type="text" name="servico" id="servico" value="<%= fornecedorParaEdicao.getServico()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="telefone">Telefone</label>
                    <input class="input" type="text" name="telefone" id="telefone" value="<%= fornecedorParaEdicao.getTelefone()%>"/>
                    <p class="data_error"></p>
                </div>
                    
                <div class="input__container">
                    <label for="email">Email</label>
                    <input class="input" type="email" name="email" id="email" value="<%= fornecedorParaEdicao.getEmail()%>"/>
                    <p class="data_error"></p>
                </div>

                <input class="sbmt__bttn" type="submit" value="Salvar" />
            </form>
        </main>

        <script type="text/javascript" src="../../js/manageForm_Fornecedor.js"></script>
    </body>
</html>
