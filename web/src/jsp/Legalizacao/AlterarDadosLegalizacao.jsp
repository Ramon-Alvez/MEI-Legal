<%-- 
    Document   : AlterarDadosLegalizacao
    Created on : 26 de nov. de 2025, 11:19:11
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Legalizacao" %>
<%@page import="ModelDAO.LegalizacaoDAO"%>
<%@page import="Model.Cliente" %>
<%@page import="Model.Funcionario" %>
<%@page import="Model.Fornecedor" %>
<%@page import="java.lang.Integer" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
            int idLegalizacao = 0;
            Legalizacao legalizacaoParaEdicao = null;

            try {
                idLegalizacao = Integer.parseInt(idString);
            } catch (NumberFormatException e) {
                out.println("<h1>Erro: ID da legalização inválido.</h1>");
                return;
            }

            LegalizacaoDAO legalizacaoDAO = new LegalizacaoDAO();
            legalizacaoParaEdicao = legalizacaoDAO.consulta_id(idLegalizacao);

            // Verifica se o Funcionário foi encontrado
            if (legalizacaoParaEdicao == null) {
                out.println("<h1>Erro: Legalização não encontrado no banco de dados.</h1>");
                return;
            }
        %>

        <main class="content">
            <header class="page_header descInfo">
                <h1>Alterar Dados da Legalização</h1>

                <p><span>Editar Legalização</span> <%= legalizacaoParaEdicao.getId()%></p>
                <hr>
            </header>

            <form class="cad__form" method="POST" action="alt_legalizacao.jsp" id="form">
                <input type="hidden" name="id" value="<%= legalizacaoParaEdicao.getId()%>">

                <form class="cad__form" method="POST" action="alt_legalizacao.jsp" id="form">
                    <div class="input__container">
                        <label for="idCliente">Selecione o Cliente</label>
                        <select name="idCliente" id="idCliente">
                            <%
                                out.println("<option value=\"" + legalizacaoParaEdicao.getIdCliente() + "\" selected disabled hidden>Selecionado: " + legalizacaoParaEdicao.getNomeCliente() + "</option>");

                                List<Cliente> listaCliente = null;
                                try {
                                    LegalizacaoDAO dao = new LegalizacaoDAO();
                                    listaCliente = dao.consultar_clientes();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println("Erro na consulta: " + e.getMessage());
                                }

                                if (listaCliente == null || listaCliente.isEmpty()) {
                                    out.println("<p style='text-align: center; grid-column: 1 / -1;'>Nenhum cliente encontrado!</p>");
                                } else {
                                    for (Cliente cliente : listaCliente) {

                                        if (cliente.getId() == legalizacaoParaEdicao.getIdCliente()) {
                                            out.println("<option value=\"" + legalizacaoParaEdicao.getIdCliente() + "\" selected>Selecionado:" + cliente.getNome() + "</option>");
                                        } else {
                                            out.println("<option value=\"" + cliente.getId() + "\">" + cliente.getNome() + "</option>");
                                        }

                                    }
                                }
                            %>
                        </select>
                        <p class="data_error"></p>
                    </div>

                    <div class="input__container">
                        <label for="tipoProcesso">Tipo do Processo</label>
                        <select name="tipoProcesso" id="tipoProcesso">
                            <%
                                out.println("<option value=\"" + legalizacaoParaEdicao.getTipoProcesso() + "\" selected hidden>Selecionado: " + legalizacaoParaEdicao.getTipoProcesso() + "</option>");
                            %>
                            <option value="Abertura" >Abertura</option>
                            <option value="Alteração">Alteração</option>
                            <option value="Baixa">Baixa</option>
                            <option value="Regularização">Regularização</option>
                        </select>
                        <p class="data_error"></p>
                    </div>

                    <div class="input__container">
                        <label for="idFornecedor">Selecione a Razão Social</label>
                        <select name="idFornecedor" id="idFornecedor">
                            <%
                                List<Fornecedor> listaFornecedor = null;
                                try {
                                    LegalizacaoDAO dao = new LegalizacaoDAO();
                                    listaFornecedor = dao.consultar_fornecedor();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println("Erro na consulta: " + e.getMessage());
                                }

                                if (listaFornecedor == null || listaFornecedor.isEmpty()) {
                                    out.println("<option>Nenhuma RS encontrado!</option>");
                                } else {
                                    for (Fornecedor fornecedor : listaFornecedor) {
                                        if (fornecedor.getId() == legalizacaoParaEdicao.getIdFuncionario()) {
                                            out.println("<option value=\"" + legalizacaoParaEdicao.getIdFornecedor()+ "\">" + fornecedor.getRazaoSocial() + "</option>");
                                        } else {
                                            out.println("<option value=\"" + fornecedor.getId() + "\">" + fornecedor.getRazaoSocial() + "</option>");
                                        }
                                        
                                    }
                                }
                            %>
                        </select>
                        <p class="data_error"></p>
                    </div>

                    <div class="input__container">
                        <label for="idFuncionario">Selecione o Funcionário</label>
                        <select name="idFuncionario" id="idFuncionario">
                            <%
                                List<Funcionario> listaFuncionario = null;
                                try {
                                    LegalizacaoDAO dao = new LegalizacaoDAO();
                                    listaFuncionario = dao.consultar_funcionario();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    out.println("Erro na consulta: " + e.getMessage());
                                }

                                if (listaFuncionario == null || listaFuncionario.isEmpty()) {
                                    out.println("<p style='text-align: center; grid-column: 1 / -1;'>Nenhum cliente encontrado!</p>");
                                } else {
                                    for (Funcionario funcionario : listaFuncionario) {

                                        if (funcionario.getId() == legalizacaoParaEdicao.getIdFuncionario()) {
                                            out.println("<option value=\"" + legalizacaoParaEdicao.getIdFuncionario() + "\" selected >Selecionado: " + funcionario.getNome() + "</option>");
                                        } else {
                                            out.println("<option value=\"" + funcionario.getId() + "\">" + funcionario.getNome() + "</option>");
                                        }

                                    }
                                }
                            %>
                        </select>
                        <p class="data_error"></p>
                    </div>

                    <div class="input__container">
                        <label for="faseProcesso">Fase do Processo</label>
                        <select name="faseProcesso" id="faseProcesso">
                            <%
                                out.println("<option value=\"" + legalizacaoParaEdicao.getFaseProcesso() + "\" selected hidden>Selecionado: " + legalizacaoParaEdicao.getFaseProcesso() + "</option>");
                            %>
                            <option value="Análise">Análise</option>
                            <option value="Protocolo">Protocolo</option>
                            <option value="Deferido">Deferido</option>
                            <option value="Concluído">Concluído</option>
                        </select>
                        <p class="data_error"></p>
                    </div>

                    <input class="sbmt__bttn" type="submit" value="Salvar" />
                </form>
        </main>

        <script type="text/javascript" src="../../js/manageForm_Legalizacao.js"/>
    </body>
</html>
