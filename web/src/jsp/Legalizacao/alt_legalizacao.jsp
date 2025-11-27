<%-- 
    Document   : alt_legalizacao
    Created on : 26 de nov. de 2025, 11:14:13
    Author     : ramon
--%>


<%@page import="java.util.*"%>
<%@page import="Model.Legalizacao" %>
<%@page import="ModelDAO.LegalizacaoDAO"%>
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
                Legalizacao legalizacao = new Legalizacao();

                String idString = request.getParameter("id");

                try {
                    int idLegalizacao = Integer.parseInt(idString);
                    legalizacao.setId(idLegalizacao);
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                    return;
                }

                // Resgatando os Dados atualizados do Formulário
                legalizacao.setTipoProcesso(request.getParameter("tipoProcesso"));
                legalizacao.setFaseProcesso(request.getParameter("faseProcesso"));
                legalizacao.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
                legalizacao.setIdFuncionario(Integer.parseInt(request.getParameter("idFuncionario")));


                /* Alteração */
                LegalizacaoDAO funcionarioDAO = new LegalizacaoDAO();
                boolean sucesso = false;

                try {
                    sucesso = funcionarioDAO.alterar(legalizacao);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Dados alterados com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Legalizacao.jsp");
                } else {
                    out.println("<p>A Legalizacao não pôde ser alterada. Tente novamente.</p>");
                }
            %>
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Legalizacao.jsp">Voltar para a Tabela</a>
            </div>
        </div>
    </body>
</html>
