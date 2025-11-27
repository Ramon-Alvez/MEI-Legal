<%-- 
    Document   : AlterarDadosCliente
    Created on : 22 de nov. de 2025, 19:13:54
    Author     : ramon
--%>

<%@page import="Model.Cliente" %>
<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.lang.Integer" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Dados do Cliente</title>

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
            int idCliente = 0;
            Cliente clienteParaEdicao = null;

            try {
                idCliente = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                out.println("<h1>Erro: ID do cliente inválido.</h1>");
                return;
            }

            ClienteDAO clienteDAO = new ClienteDAO();
            clienteParaEdicao = clienteDAO.consulta_id(idCliente);

            // Verifica se o Cliente foi encontrado
            if (clienteParaEdicao == null) {
                out.println("<h1>Erro: Cliente não encontrado no banco de dados.</h1>");
                return;
            }

            // Converter a Data para o formato exigido
            DateTimeFormatter formatadorHTML = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String dataFormatada = "";

            if (clienteParaEdicao.getDataCadastro() != null) {
                dataFormatada = clienteParaEdicao.getDataCadastro().format(formatadorHTML);
            }
        %>

        <main class="content">
            <header class="page_header descInfo">
                <h1>Alterar Dados do Cliente</h1>

                <p><span>Editar Cliente:</span> <%= clienteParaEdicao.getNome()%></p>
            </header>

            <form class="cad__form" method="POST" action="alt_cliente.jsp" id="form">
                <input type="hidden" name="id" value="<%= clienteParaEdicao.getId()%>">

                <div class="input__container">
                    <label for="nome">Nome</label>
                    <input class="input" type="text" name="nome" id="nome" value="<%= clienteParaEdicao.getNome()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="cpf">CPF</label>
                    <input class="input" type="text" name="cpf" id="cpf" value="<%= clienteParaEdicao.getCPF()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="idade">Idade</label>
                    <input class="input" type="number" name="idade" id="idade" value="<%= clienteParaEdicao.getIdade()%>"/>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="dataCadastro">Data Cadastro</label>
                    <input class="input" type="date" name="dataCadastro" id="dataCadastro" value="<%= dataFormatada%>"/>
                    <p class="data_error"></p>
                </div>

                <input class="sbmt__bttn" type="submit" value="Salvar" />
            </form>
        </main>

        <script type="text/javascript" src="../../js/manageForm_Cliente.js"></script>
    </body>
</html>
