package ModelDAO;

import Model.Cliente;
import Config.ConectaBanco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

/**
 *
 * @author ramon
 */
public class ClienteDAO {

    // + cadastrar(Cliente): boolean
    public boolean cadastrar(Cliente cliente) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "INSERT INTO Clientes "
                    + "(Nome, CPF, Idade, DataCadastro) "
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getCPF());
            stmt.setInt(3, cliente.getIdade());
            stmt.setObject(4, cliente.getDataCadastro());

            stmt.executeUpdate();

            // Captura ID gerado
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    cliente.setId(rs.getInt(1));
                }
            }

            conn.close();
            return true;
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return false;
        }
    }

    // + consultar_geral(): List<Cliente>
    public List<Cliente> consultar_geral() throws ClassNotFoundException {
        List<Cliente> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM Clientes";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt("Id"));
                cliente.setNome(rs.getString("Nome"));
                cliente.setCPF(rs.getString("CPF"));
                cliente.setIdade(rs.getInt("Idade"));
                cliente.setDataCadastro(rs.getObject("DataCadastro", LocalDate.class));

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

    // + consulta_id(): Cliente
    public Cliente consulta_id(int id) throws ClassNotFoundException {
        Connection conn = null;
        Cliente cliente = null;

        String sql = "SELECT * FROM Clientes WHERE Id = ?";

        try {
            conn = ConectaBanco.conectar();

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, id);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        cliente = new Cliente();
                        cliente.setId(rs.getInt("Id"));
                        cliente.setNome(rs.getString("Nome"));
                        cliente.setCPF(rs.getString("CPF"));
                        cliente.setIdade(rs.getInt("Idade"));
                        cliente.setDataCadastro(rs.getObject("DataCadastro", LocalDate.class));
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

        return cliente;
    }

    // + alterar(Cliente): boolean
    public boolean alterar(Cliente cliente) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            String sql = "UPDATE Clientes SET Nome=?, CPF=?, Idade=?, DataCadastro=? WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, cliente.getNome());
                stmt.setString(2, cliente.getCPF());
                stmt.setInt(3, cliente.getIdade());
                stmt.setObject(4, cliente.getDataCadastro()); 
                
                stmt.setInt(5, cliente.getId());

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
    
    // + deletar(Cliente): boolean
    public boolean deletar(Cliente cliente) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            String sql = "DELETE FROM Clientes WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {             
                stmt.setInt(1, cliente.getId());

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
