package ModelDAO;

import Model.Funcionario;
import Config.ConectaBanco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
 * @author ramon
 */
public class FuncionarioDAO {

    // + cadastrar(Funcionario): boolean
    public boolean cadastrar(Funcionario funcionario) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "INSERT INTO Funcionarios "
                    + "(Nome, CPF, Email, Telefone) "
                    + "VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getCPF());
            stmt.setString(3, funcionario.getEmail());
            stmt.setString(4, funcionario.getTelefone());

            stmt.executeUpdate();

            // Captura ID gerado
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    funcionario.setId(rs.getInt(1));
                }
            }

            conn.close();
            return true;
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return false;
        }
    }

    // + consultar_geral(): List<Funcionario>
    public List<Funcionario> consultar_geral() throws ClassNotFoundException {
        List<Funcionario> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM Funcionarios";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Funcionario funcionario = new Funcionario();

                funcionario.setId(rs.getInt("Id"));
                funcionario.setNome(rs.getString("Nome"));
                funcionario.setCPF(rs.getString("CPF"));
                funcionario.setEmail(rs.getString("Email"));
                funcionario.setTelefone(rs.getString("Telefone"));

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

    // + consulta_id(): Funcionario
    public Funcionario consulta_id(int id) throws ClassNotFoundException {
        Connection conn = null;
        Funcionario funcionario = null;

        String sql = "SELECT * FROM Funcionarios WHERE Id = ?";

        try {
            conn = ConectaBanco.conectar();

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, id);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        funcionario = new Funcionario();
                        funcionario.setId(rs.getInt("Id"));
                        funcionario.setNome(rs.getString("Nome"));
                        funcionario.setCPF(rs.getString("CPF"));
                        funcionario.setEmail(rs.getString("Email"));
                        funcionario.setTelefone(rs.getString("Telefone"));
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

        return funcionario;
    }

    // + alterar(Funcionario): boolean
    public boolean alterar(Funcionario funcionario) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            // O SQL está correto com 'Id' maiúsculo, conforme sua DDL
            String sql = "UPDATE Funcionarios SET Nome=?, CPF=?, Email=?, Telefone=? WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, funcionario.getNome());
                stmt.setString(2, funcionario.getCPF());
                stmt.setString(3, funcionario.getEmail());
                stmt.setString(4, funcionario.getTelefone());

                stmt.setInt(5, funcionario.getId());

                // CORREÇÃO: Verifica se alguma linha foi afetada
                int linhasAfetadas = stmt.executeUpdate();

                return linhasAfetadas > 0; // Retorna TRUE se a alteração ocorreu
            }

        } catch (SQLException err) {
            System.out.println("Erro SQL ao alterar funcionário: " + err);
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

    // + deletar(Funcionario): boolean
    public boolean deletar(Funcionario funcionario) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            String sql = "DELETE FROM Funcionarios WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, funcionario.getId());

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
