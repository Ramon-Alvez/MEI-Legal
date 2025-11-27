<%-- 
    Document   : Funcionarios
    Created on : 25 de nov. de 2025, 14:23:50
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Funcionario"%>
<%@page import="ModelDAO.FuncionarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Funcionários</title>

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
                <h1>Cadastro de Funcionário</h1>
                <a class="insert__bttn" href="../../html/CadastroFuncionario.html">Inserir</a>
            </header>

            <%
                List<Funcionario> lista = null;
                try {
                    FuncionarioDAO dao = new FuncionarioDAO();
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
                    out.println("            <th>Nome</th>");
                    out.println("            <th>CPF</th>");
                    out.println("            <th>Idade</th>");
                    out.println("            <th>Data Cadastro</th>");
                    out.println("            <th class=\"edit\">Editar</th>");
                    out.println("            <th class=\"delete\">Excluir</th>");
                    out.println("        </tr>");
                    out.println("    </thead>");
                    out.println("    <tbody>");
                    out.println("        <tr class=\"hidden\">");
                    out.println("            <td>blank</td>");
                    out.println("        </tr>");
                    for (Funcionario funcionario : lista) {
                        out.println("<tr class=\"table__row\">");
                        out.println("    <td>" + funcionario.getId() + "</td>");
                        out.println("    <td>" + funcionario.getNome() + "</td>");
                        out.println("    <td>" + funcionario.getCPF() + "</td>");
                        out.println("    <td>" + funcionario.getEmail() + "</td>");
                        out.println("    <td>" + funcionario.getTelefone() + "</td>");

                        out.println("    <td class=\"edit\"><a href=\"AlterarDadosFuncionario.jsp?id=" + funcionario.getId() + "\"><i class=\"fa-regular fa-pen-to-square\"></i></a></td>");
                        out.println("    <td class=\"delete\"><a href=\"del_funcionario.jsp?id=" + funcionario.getId() + "\"><i class=\"fa-regular fa-trash-can\"></i></a></td>");
                        out.println("</tr>");
                    }
                    out.println("    </tbody>");
                    out.println("</table>");
                }
            %>
        </main>
    </body>
</html>
