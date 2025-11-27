<%-- 
    Document   : del_fornecedor
    Created on : 25 de nov. de 2025, 21:22:48
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Fornecedor" %>
<%@page import="ModelDAO.FornecedorDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processando Alteração</title>
    
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
                Fornecedor fornecedor = new Fornecedor();

                String idString = request.getParameter("id");

                try {
                    int idFornecedor = Integer.parseInt(idString);
                    fornecedor.setId(idFornecedor);
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                    return;
                }

                /* Alteração */
                FornecedorDAO fornecedorDAO = new FornecedorDAO();
                boolean sucesso = false;

                try {
                    sucesso = fornecedorDAO.deletar(fornecedor);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Fornecedor apagado com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Fornecedores.jsp");
                    
                } else {
                    out.println("<p>O Fornecedor não pôde ser apagado. Tente novamente.</p>");
                }
            %>
            
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Fornecedores.jsp">Voltar para a Tabela</a>
            </div>
        </div>
    </body>
</html>
