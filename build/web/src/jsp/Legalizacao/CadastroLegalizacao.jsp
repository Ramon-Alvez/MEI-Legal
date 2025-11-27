<%-- 
    Document   : CadastroLegalizacao
    Created on : 26 de nov. de 2025, 09:57:51
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Legalizacao" %>
<%@page import="Model.Cliente" %>
<%@page import="Model.Funcionario" %>
<%@page import="Model.Fornecedor" %>
<%@page import="ModelDAO.LegalizacaoDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Cadastro Legalização</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- CSS -->
        <link rel="stylesheet" href="../../css/variables.css"/>
        <link rel="stylesheet" href="../../css/reset.css"/>
        <link rel="stylesheet" href="../../css/main.css"/>
        <link rel="stylesheet" href="../../css/forms.css"/>
    </head>
    <body>
        <main class="content">
            <header class="page_header">
                <h1>Cadastro Legalização</h1>

                <a class="bttn" href="Legalizacao.jsp">Voltar</a>
            </header>

            <form class="cad__form" method="POST" action="cad_legalizacao.jsp" id="form">
                <div class="input__container">
                    <label for="idCliente">Selecione o Cliente</label>
                    <select name="idCliente" id="idCliente">
                        <option value="" disabled selected hidden>Selecione o Cliente</option>
                        <%
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
                                    out.println("<option value=\"" + cliente.getId() + "\">" + cliente.getNome() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="tipoProcesso">Tipo do Processo</label>
                    <select name="tipoProcesso" id="tipoProcesso">
                        <option value="" disabled selected hidden>Selecione o Tipo de Processo</option>
                        <option value="Abertura">Abertura</option>
                        <option value="Alteração">Alteração</option>
                        <option value="Baixa">Baixa</option>
                        <option value="Regularização">Regularização</option>
                    </select>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="idFornecedor">Selecione a Razão Social</label>
                    <select name="idFornecedor" id="idFornecedor">
                        <option value="" disabled selected hidden>Selecione a Razão Social Responsável</option>
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
                                    out.println("<option value=\"" + fornecedor.getId() + "\">" + fornecedor.getRazaoSocial() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="idFuncionario">Selecione o Funcionário</label>
                    <select name="idFuncionario" id="idFuncionario">
                        <option value="" disabled selected hidden>Selecione o Funcionário Responsável</option>
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
                                    out.println("<option value=\"" + funcionario.getId() + "\">" + funcionario.getNome() + "</option>");
                                }
                            }
                        %>
                    </select>
                    <p class="data_error"></p>
                </div>

                <div class="input__container">
                    <label for="faseProcesso">Fase do Processo</label>
                    <select name="faseProcesso" id="faseProcesso">
                        <option value="" disabled selected hidden>Selecione a Fase do Processo</option>
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

        <script type="text/javascript" src="../../js/manageForm_Legalizacao.js"></script>
    </body>
</html>
