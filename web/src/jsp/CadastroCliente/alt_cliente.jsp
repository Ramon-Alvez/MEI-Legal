
<%-- 
    Document   : alt_cliente
    Created on : 22 de nov. de 2025, 18:04:13
    Author     : ramon
--%>


<%@page import="java.util.*"%>
<%@page import="Model.Cliente" %>
<%@page import="ModelDAO.ClienteDAO"%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.lang.Integer"%>


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

                // Resgatando os Dados atualizados do Formulário
                cliente.setNome(request.getParameter("nome"));
                cliente.setCPF(request.getParameter("cpf"));
                cliente.setIdade(Integer.parseInt(request.getParameter("idade")));

                /* Data e sua conversão para um valor válido para o SQL */
                String dataString = request.getParameter("dataCadastro");
                LocalDate DataCadastro = LocalDate.parse(dataString);
                cliente.setDataCadastro(DataCadastro);

                /* Alteração */
                ClienteDAO clienteDAO = new ClienteDAO();
                boolean sucesso = false;

                try {
                    sucesso = clienteDAO.alterar(cliente);
                } catch (ClassNotFoundException e) {
                    out.println("<p>Erro: Driver do banco de dados não encontrado.</p>");
                }

                if (sucesso) {
                    out.println("<p>Dados alterados com sucesso!</p>");

                    response.setHeader("Refresh", "2; URL=Clientes.jsp");
                } else {
                    out.println("<p>O Cliente não pôde ser alterado. Tente novamente.</p>");
                }
            %>
            <div class="modal__bttn__container singleBttn">
                <a class="bttn" href="Clientes.jsp">Voltar para a Tabela</a>
            </div>
        </div>
    </body>
</html>