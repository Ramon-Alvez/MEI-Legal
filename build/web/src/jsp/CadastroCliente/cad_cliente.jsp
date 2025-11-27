<%-- 
    Document   : cad_cliente
    Created on : 22 de nov. de 2025, 16:13:12
    Author     : ramon
--%>

<%@page import="java.util.*"%>
<%@page import="Model.Cliente" %>
<%@page import="ModelDAO.ClienteDAO"%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Cliente</title>

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
                Cliente cliente = new Cliente();

                // Configurando o formatador - (DD/MM/YYYY)
                // OBS: O formatador abaixo não é mais usado se o input for type="date",
                //      mas é mantido para seguir sua estrutura.
                //      A conversão foi ajustada para o formato YYYY-MM-DD (padrão HTML5)
                DateTimeFormatter formatador = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                String dataString = request.getParameter("dataCadastro");
                LocalDate DataCadastro = null;

                cliente.setNome(request.getParameter("nome"));
                cliente.setCPF(request.getParameter("cpf"));

                // Tratamento simplificado de idade para evitar NumberFormatException ao parsear null
                String idadeString = request.getParameter("idade");
                if (idadeString != null && !idadeString.isEmpty()) {
                    cliente.setIdade(Integer.parseInt(idadeString));
                } else {
                    cliente.setIdade(0); // Valor padrão em caso de erro/vazio
                }

                // Tratamento e Conversão da Data
                if (dataString != null && !dataString.isEmpty()) {
                    // A conversão usa o formato ISO (YYYY-MM-DD) retornado pelo input type="date"
                    DataCadastro = LocalDate.parse(dataString);
                }

                cliente.setDataCadastro(DataCadastro);

                //Gravar...
                ClienteDAO clienteDAO = new ClienteDAO();
                if (clienteDAO.cadastrar(cliente)) {
                    out.println("<p>Cliente cadastrado com sucesso!</p>");
                    
                    response.setHeader("Refresh", "2; URL=Clientes.jsp");
                } else {
                    out.println("<p>Cliente não cadastrado!</p>");
                }
            %>
            <div class="modal__bttn__container">
                <a class="bttn" href="../../html/CadastroCliente.html">Cadastrar outro Cliente</a>
                <a class="bttn" href="Clientes.jsp">Voltar</a>
            </div>
        </div>
    </body>
</html>