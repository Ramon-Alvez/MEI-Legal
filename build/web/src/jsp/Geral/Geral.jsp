<%-- 
    Document   : Geral
    Created on : 26 de nov. de 2025, 16:16:28
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Geral"%>
<%@page import="ModelDAO.GeralDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Geral</title>

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
                <h1>Visão Geral</h1>
            </header>

            <%
                List<Geral> lista = null;
                try {
                    GeralDAO dao = new GeralDAO();
                    lista = dao.consultar_geral();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<div class='modal__erro'>");
                    out.println("   <h2>Erro na consulta: " + e.getMessage()+"</h2>");
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
                    out.println("            <th>Cliente</th>");
                    out.println("            <th>Serviço Prestado</th>");
                    out.println("            <th>Tipo do Processo</th>");
                    out.println("            <th>Funcionario Responsável</th>");
                    out.println("            <th class=\"status\">Ativo?</th>");
                    out.println("        </tr>");
                    out.println("    </thead>");
                    out.println("    <tbody>");
                    out.println("        <tr class=\"hidden\">");
                    out.println("            <td>blank</td>");
                    out.println("        </tr>");
                    for (Geral geral : lista) {
                        out.println("<tr class=\"table__row\">");
                        out.println("    <td>" + geral.getId() + "</td>");
                        out.println("    <td>" + geral.getRazaoSocial() + "</td>");
                        out.println("    <td>" + geral.getNomeCliente() + "</td>");
                        out.println("    <td>" + geral.getServicoPrestado() + "</td>");
                        out.println("    <td>" + geral.getTipoProcesso() + "</td>");
                        out.println("    <td>" + geral.getNomeFuncionario() + "</td>");
                        Boolean status = geral.getStatus();

                        if (status == true) {
                            out.println("    <td class='status'><i class=\"fa-regular fa-square-check\"></i></td>");
                        } else {
                            out.println("    <td class='status'><i class=\"fa-regular fa-square\"></i></td>");
                        }

                        out.println("</tr>");
                    }
                    out.println("    </tbody>");
                    out.println("</table>");
                }
            %>
        </main>
    </body>
</html>
