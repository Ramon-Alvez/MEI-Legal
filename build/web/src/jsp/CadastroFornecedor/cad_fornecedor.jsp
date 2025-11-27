<%-- 
    Document   : cad_fornecedor
    Created on : 25 de nov. de 2025, 21:05:05
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
        <title>Cadastrar Fornecedor</title>

        <!-- CSS -->
        <link rel="stylesheet" href="../../css/variables.css"/>
        <link rel="stylesheet" href="../../css/reset.css"/>
        <link rel="stylesheet" href="../../css/main.css"/>
        <link rel="stylesheet" href="../../css/modal.css"/>
    </head>
    <body>
        <div class="modal__cadastro">
            <h1>Cadastrar Fornecedor</h1>
            <%
                // Instância do Objeto
                Fornecedor fornecedor = new Fornecedor();

                fornecedor.setRazaoSocial(request.getParameter("razaoSocial"));
                fornecedor.setCNPJ(request.getParameter("cnpj"));
                fornecedor.setServico(request.getParameter("servico"));
                fornecedor.setTelefone(request.getParameter("telefone"));
                fornecedor.setEmail(request.getParameter("email"));

                //Gravar...
                FornecedorDAO fornecedorDAO = new FornecedorDAO();
                if (fornecedorDAO.cadastrar(fornecedor)) {
                    out.println("<p>Fornecedor cadastrado com sucesso!</p>");
                    
                    response.setHeader("Refresh", "2; URL=Fornecedores.jsp");
                } else {
                    out.println("<p>Fornecedor não cadastrado!</p>");
                }
            %>
            <div class="modal__bttn__container">
                <a class="bttn" href="../../html/CadastroFornecedor.html">Cadastrar outro Funcionário</a>
                <a class="bttn" href="Fornecedores.jsp">Voltar</a>
            </div>
        </div>
    </body>
</html>
