<%-- 
    Document   : del_cliente
    Created on : 22 de nov. de 2025, 20:08:41
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Cliente" %>
<%@page import="ModelDAO.ClienteDAO"%>


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
                Cliente cliente = new Cliente();

                String idString = request.getParameter("id");

                try {
                    int idCliente = Integer.parseInt(idString);
                    cliente.setId(idCliente);
                } catch (NumberFormatException e) {
                    out.println("<p>ID inválido.</p>");
                    return;
                }

                /* Alteração */
                ClienteDAO clienteDAO = new ClienteDAO();
                boolean sucesso = false;

                try {
                    sucesso = clienteDAO.deletar(cliente);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Cliente apagado com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Clientes.jsp");
                    
                } else {
                    out.println("<p>O Cliente não pôde ser apagado. Tente novamente.</p>");
                }
            %>
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Clientes.jsp">Voltar para a Tabela</a>
            </div>
    </body>
</html>
