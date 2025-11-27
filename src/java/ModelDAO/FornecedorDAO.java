/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import Model.Fornecedor;
import Config.ConectaBanco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
 * @author ramon
 */
public class FornecedorDAO {

    // + cadastrar(Fornecedor): boolean
    public boolean cadastrar(Fornecedor fornecedor) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            String sql = "INSERT INTO Fornecedores "
                    + "(RazaoSocial, CNPJ, Servico, Telefone, Email) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, fornecedor.getRazaoSocial());
            stmt.setString(2, fornecedor.getCNPJ());
            stmt.setString(3, fornecedor.getServico());
            stmt.setString(4, fornecedor.getTelefone());
            stmt.setString(5, fornecedor.getEmail());

            stmt.executeUpdate();

            // Captura ID gerado
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    fornecedor.setId(rs.getInt(1));
                }
            }

            conn.close();
            return true;
        } catch (SQLException err) {
            System.out.println("Erro SQL: " + err);
            return false;
        }
    }

    // + consultar_geral(): List<Fornecedor>
    public List<Fornecedor> consultar_geral() throws ClassNotFoundException {
        List<Fornecedor> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM Fornecedores";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();

                fornecedor.setId(rs.getInt("Id"));
                fornecedor.setRazaoSocial(rs.getString("RazaoSocial"));
                fornecedor.setCNPJ(rs.getString("CNPJ"));
                fornecedor.setServico(rs.getString("Servico"));
                fornecedor.setTelefone(rs.getString("Telefone"));
                fornecedor.setEmail(rs.getString("Email"));

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

    // + consulta_id(): Fornecedor
    public Fornecedor consulta_id(int id) throws ClassNotFoundException {
        Connection conn = null;
        Fornecedor fornecedor = null;

        String sql = "SELECT * FROM Fornecedores WHERE Id = ?";

        try {
            conn = ConectaBanco.conectar();

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, id);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        fornecedor = new Fornecedor();
                        fornecedor.setId(rs.getInt("Id"));
                        fornecedor.setRazaoSocial(rs.getString("RazaoSocial"));
                        fornecedor.setCNPJ(rs.getString("CNPJ"));
                        fornecedor.setServico(rs.getString("Servico"));
                        fornecedor.setTelefone(rs.getString("Telefone"));
                        fornecedor.setEmail(rs.getString("Email"));
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

        return fornecedor;
    }

    // + alterar(Fornecedor): boolean
    public boolean alterar(Fornecedor fornecedor) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            // O SQL está correto com 'Id' maiúsculo, conforme sua DDL
            String sql = "UPDATE Fornecedores SET RazaoSocial=?, CNPJ=?, Servico=?, Telefone=?, Email=? WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fornecedor.getRazaoSocial());
                stmt.setString(2, fornecedor.getCNPJ());
                stmt.setString(3, fornecedor.getServico());
                stmt.setString(4, fornecedor.getTelefone());
                stmt.setString(5, fornecedor.getEmail());

                stmt.setInt(6, fornecedor.getId());

                // CORREÇÃO: Verifica se alguma linha foi afetada
                int linhasAfetadas = stmt.executeUpdate();

                return linhasAfetadas > 0; // Retorna TRUE se a alteração ocorreu
            }

        } catch (SQLException err) {
            System.out.println("Erro SQL ao alterar fornecedor: " + err);
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

    // + deletar(Fornecedor): boolean
    public boolean deletar(Fornecedor fornecedor) throws ClassNotFoundException {
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();

            String sql = "DELETE FROM Fornecedores WHERE Id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, fornecedor.getId());

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
