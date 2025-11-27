<%-- 
    Document   : cad_legalizacao
    Created on : 26 de nov. de 2025, 10:37:47
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Legalizacao" %>
<%@page import="ModelDAO.LegalizacaoDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Legalização</title>
 
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
                Legalizacao legalizacao = new Legalizacao();

                legalizacao.setTipoProcesso(request.getParameter("tipoProcesso"));
                legalizacao.setFaseProcesso(request.getParameter("faseProcesso"));
                legalizacao.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
                legalizacao.setIdFuncionario(Integer.parseInt(request.getParameter("idFuncionario")));
                legalizacao.setIdFornecedor(Integer.parseInt(request.getParameter("idFornecedor")));

                //Gravar...
                LegalizacaoDAO funcionarioDAO = new LegalizacaoDAO();
                if (funcionarioDAO.cadastrar(legalizacao)) {
                    out.println("<p>Legalização cadastrada com sucesso!</p>");
                    
                    response.setHeader("Refresh", "2; URL=Legalizacao.jsp");
                } else {
                    out.println("<p>Legalização não cadastrada!</p>");
                }
            %>
            <div class="modal__bttn__container">
                <a class="bttn" href="CadastroLegalizacao.jsp">Cadastrar outro Funcionário</a>
                <a class="bttn" href="Legalizacao.jsp">Voltar</a>
            </div>
        </div>
    </body>
</html>
