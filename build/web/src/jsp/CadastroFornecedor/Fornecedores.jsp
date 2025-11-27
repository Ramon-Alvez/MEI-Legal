<%-- 
    Document   : Fornecedor
    Created on : 25 de nov. de 2025, 20:56:27
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Fornecedor"%>
<%@page import="ModelDAO.FornecedorDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedores</title>

        <!-- CSS -->
        <link rel="stylesheet" href="../../css/variables.css"/>
        <link rel="stylesheet" href="../../css/reset.css"/>
        <link rel="stylesheet" href="../../css/main.css"/>
        <link rel="stylesheet" href="../../css/modal.css"/>
        <link rel="stylesheet" href="../../css/consultTables.css"/>

        <!-- FontAwesome Icon - CDN Import -->
        <link rel="stylesheet" 
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" 
              crossorigin="anonymous" 
              referrerpolicy="no-referrer" />
    </head>
    <body>
        <main class="content">
            <header class="page_header">
                <h1>Cadastro de Fornecedor</h1>
                <a class="insert__bttn" href="../../html/CadastroFornecedor.html">Inserir</a>
            </header>

            <%
                List<Fornecedor> lista = null;
                try {
                    FornecedorDAO dao = new FornecedorDAO();
                    lista = dao.consultar_geral();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='modal__erro'>");
                    out.println("   <h2>Erro na consulta: " + e.getMessage() + "</h2>");
                    out.println("</div>");
                }

                if (lista == null || lista.isEmpty()) {
                    out.println("<div class='modal__semDados'>");
                    out.println("   <h2>Nenhum Dado encontrado.</h2>");
                    out.println("</div>");
                } else {
                    out.println("<table class=\"table\">");
                    out.println("    <thead>");
                    out.println("        <tr class=\"table__header\">");
                    out.println("            <th>ID</th>");
                    out.println("            <th>Razão Social</th>");
                    out.println("            <th>CNPJ</th>");
                    out.println("            <th>Serviços Prestados</th>");
                    out.println("            <th>Telefone</th>");
                    out.println("            <th>Email</th>");
                    out.println("            <th class=\"edit\">Editar</th>");
                    out.println("            <th class=\"delete\">Excluir</th>");
                    out.println("        </tr>");
                    out.println("    </thead>");
                    out.println("    <tbody>");
                    out.println("        <tr class=\"hidden\">");
                    out.println("            <td>blank</td>");
                    out.println("        </tr>");
                    for (Fornecedor fornecedor : lista) {
                        out.println("<tr class=\"table__row\">");
                        out.println("    <td>" + fornecedor.getId() + "</td>");
                        out.println("    <td>" + fornecedor.getRazaoSocial() + "</td>");
                        out.println("    <td>" + fornecedor.getCNPJ() + "</td>");
                        out.println("    <td>" + fornecedor.getServico() + "</td>");
                        out.println("    <td>" + fornecedor.getTelefone() + "</td>");
                        out.println("    <td>" + fornecedor.getEmail() + "</td>");

                        out.println("    <td class=\"edit\"><a href=\"AlterarDadosFornecedor.jsp?id=" + fornecedor.getId() + "\"><i class=\"fa-regular fa-pen-to-square\"></i></a></td>");
                        out.println("    <td class=\"delete\"><a href=\"del_fornecedor.jsp?id=" + fornecedor.getId() + "\"><i class=\"fa-regular fa-trash-can\"></i></a></td>");
                        out.println("</tr>");
                    }
                    out.println("    </tbody>");
                    out.println("</table>");
                }
            %>
        </main>
    </body>
</html>
