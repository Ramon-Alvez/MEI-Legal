<%-- 
    Document   : alt_fornecedor
    Created on : 25 de nov. de 2025, 22:15:17
    Author     : ramon
--%>


<%@page import="java.util.*"%>
<%@page import="Model.Fornecedor" %>
<%@page import="ModelDAO.FornecedorDAO"%>
<%@page import="java.lang.Integer"%>

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

                // Resgatando os Dados atualizados do Formulário
                fornecedor.setRazaoSocial(request.getParameter("razaoSocial"));
                fornecedor.setCNPJ(request.getParameter("cnpj"));
                fornecedor.setServico(request.getParameter("servico"));
                fornecedor.setTelefone(request.getParameter("telefone"));
                fornecedor.setEmail(request.getParameter("email"));


                /* Alteração */
                FornecedorDAO funcionarioDAO = new FornecedorDAO();
                boolean sucesso = false;

                try {
                    sucesso = funcionarioDAO.alterar(fornecedor);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Dados alterados com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Funcionarios.jsp");
                } else {
                    out.println("<p>O Fornecedor não pôde ser alterado. Tente novamente.</p>");
                    out.println("<p>"+ fornecedor.getId() +"</p>");
                    out.println("<p>"+ fornecedor.getRazaoSocial() +"</p>");
                    out.println("<p>"+ fornecedor.getCNPJ() +"</p>");
                    out.println("<p>"+ fornecedor.getServico() +"</p>");
                    out.println("<p>"+ fornecedor.getTelefone() +"</p>");
                    out.println("<p>"+ fornecedor.getEmail() +"</p>");
                }
            %>
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Fornecedores.jsp">Voltar para a Tabela</a>
            </div>
        </div>
    </body>
</html>
