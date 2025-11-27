package ModelDAO;

import Model.Legalizacao;
import Model.Cliente;
import Model.Funcionario;
import Model.Fornecedor;
import Config.ConectaBanco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
 * @author ramon
 */
public class LegalizacaoDAO {

    // + cadastrar(Legalizacao): boolean
    public boolean cadastrar(Legalizacao legalizacao) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "INSERT INTO Legalizacao "
                    + "(TipoProcesso, FaseProcesso, IdCliente, IdFuncionario, IdFornecedor) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, legalizacao.getTipoProcesso());
            stmt.setString(2, legalizacao.getFaseProcesso());
            stmt.setInt(3, legalizacao.getIdCliente());
            stmt.setInt(4, legalizacao.getIdFuncionario());
            stmt.setInt(5, legalizacao.getIdFornecedor());

            stmt.executeUpdate();

            // Captura ID gerado
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    legalizacao.setId(rs.getInt(1));
                }
            }

            conn.close();
            return true;
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return false;
        }
    }

    // + consultar_geral(): List<Legalizacao>
    public List<Legalizacao> consultar_geral() throws ClassNotFoundException {
        List<Legalizacao> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();

            String sql = "SELECT "
                        + "     L.Id, L.IdCliente, L.IdFuncionario, L.IdFornecedor, "
                        + "     L.TipoProcesso, L.FaseProcesso, "
                        + "     C.Nome AS Cliente, "
                        + "     Fu.Nome AS FuncionarioResponsavel, "
                        + "     Fo.RazaoSocial "
                        + "FROM Legalizacao L "
                        + "     INNER JOIN Clientes C ON L.IdCliente = C.Id "
                        + "     INNER JOIN Funcionarios Fu ON L.IdFuncionario = Fu.Id " // Usando Fu como alias, conforme sua query original
                        + "     INNER JOIN Fornecedores Fo ON L.IdFornecedor = Fo.Id";

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Legalizacao legalizacao = new Legalizacao();

                legalizacao.setId(rs.getInt("Id"));
                legalizacao.setTipoProcesso(rs.getString("TipoProcesso"));
                legalizacao.setFaseProcesso(rs.getString("FaseProcesso"));
                
                // Campos FKs originais
                legalizacao.setIdCliente(rs.getInt("IdCliente"));
                legalizacao.setIdFuncionario(rs.getInt("IdFuncionario"));
                legalizacao.setIdFornecedor(rs.getInt("IdFornecedor"));
          
                // Mapeando os nomes
                legalizacao.setNomeCliente(rs.getString("Cliente"));
                legalizacao.setNomeFuncionario(rs.getString("FuncionarioResponsavel")); // Nome usado como alias na query SQL
                legalizacao.setRazaoSocial(rs.getString("RazaoSocial"));
                
                lista.add(legalizacao);
            }

            conn.close();

            
            if (lista.isEmpty()) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return null;
        }
    }

    
    // Necessário para as opções da lista de seleção
    // + consultar_clientes(): List<Clientes>
    public List<Cliente> consultar_clientes() throws ClassNotFoundException {
        List<Cliente> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT Id, Nome FROM Clientes";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Cliente cliente = new Cliente();

                cliente.setId(rs.getInt("Id"));
                cliente.setNome(rs.getString("Nome"));

                lista.add(cliente);
            }

            conn.close();
            if (lista.isEmpty()) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return null;
        }
    }

    // Necessário para as opções da lista de seleção
    // + consultar_funcionario(): List<Funcionario>
    public List<Funcionario> consultar_funcionario() throws ClassNotFoundException {
        List<Funcionario> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT Id, Nome FROM Funcionarios";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Funcionario funcionario = new Funcionario();

                funcionario.setId(rs.getInt("Id"));
                funcionario.setNome(rs.getString("Nome"));

                lista.add(funcionario);
            }

            conn.close();
            if (lista.isEmpty()) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return null;
        }
    }
    
    // Necessário para as opções da lista de seleção
    // + consultar_fornecedor(): List<Fornecedor>
    public List<Fornecedor> consultar_fornecedor() throws ClassNotFoundException {
        List<Fornecedor> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT Id, RazaoSocial FROM Fornecedores";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();

                fornecedor.setId(rs.getInt("Id"));
                fornecedor.setRazaoSocial(rs.getString("RazaoSocial"));

                lista.add(fornecedor);
            }

            conn.close();
            if (lista.isEmpty()) {
                return null;
            } else {
                return lista;
            }
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return null;
        }
    }

    
    // + consulta_id(): Legalizacao
    public Legalizacao consulta_id(int id) throws ClassNotFoundException {
        Connection conn = null;
        Legalizacao legalizacao = null;

        String sql = "SELECT * FROM Legalizacao WHERE Id = ?";

        try {
            conn = ConectaBanco.conectar();

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, id);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        legalizacao = new Legalizacao();
                        legalizacao.setId(rs.getInt("Id"));
                        legalizacao.setTipoProcesso(rs.getString("TipoProcesso"));
                        legalizacao.setFaseProcesso(rs.getString("FaseProcesso"));
                        legalizacao.setIdCliente(rs.getInt("IdCliente"));
                        legalizacao.setIdFuncionario(rs.getInt("IdFuncionario"));
                    }
                }
            }

        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException err) {
                    System.out.println("Erro de Conexão: " + err);
                }
            }
        }

        return legalizacao;
    }

    // + alterar(Legalizacao): boolean
    public boolean alterar(Legalizacao legalizacao) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            // O SQL está correto com 'Id' maiúsculo, conforme sua DDL
            String sql = "UPDATE Legalizacao SET TipoProcesso=?, FaseProcesso=?, IdCliente=?, IdFuncionario=? WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, legalizacao.getTipoProcesso());
                stmt.setString(2, legalizacao.getFaseProcesso());
                stmt.setInt(3, legalizacao.getIdCliente());
                stmt.setInt(4, legalizacao.getIdFuncionario());

                stmt.setInt(5, legalizacao.getId());

                // CORREÇÃO: Verifica se alguma linha foi afetada
                int linhasAfetadas = stmt.executeUpdate();

                return linhasAfetadas > 0; // Retorna TRUE se a alteração ocorreu
            }

        } catch (SQLException err) {
            System.out.println("Erro SQL ao alterar as informações da Legalizacao: " + err);
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close(); // Fechamento seguro no finally
                } catch (SQLException err) {
                    System.out.println("Erro ao fechar conexão: " + err);
                }
            }
        }
    }

    // + deletar(Legalizacao): boolean
    public boolean deletar(Legalizacao legalizacao) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            String sql = "DELETE FROM Legalizacao WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, legalizacao.getId());

                stmt.executeUpdate();
            }

            return true;
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException err) {
                    System.out.println("Erro de Conexão: " + err);
                }
            }
        }
    }
}
