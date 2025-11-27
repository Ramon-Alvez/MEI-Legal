package ModelDAO;

// Importação das Models
import Model.Geral;

// Demais importações
import Config.ConectaBanco;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*
 * @author ramon
 */
public class GeralDAO {

    // + consultar_geral(): List<Geral>
    public List<Geral> consultar_geral() throws ClassNotFoundException {
        List<Geral> lista = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConectaBanco.conectar();
            Statement stmt = conn.createStatement();

            String sql = "SELECT "
                        + "     L.Id, L.IdCliente, L.IdFuncionario, L.IdFornecedor, "
                        + "     L.TipoProcesso, L.FaseProcesso, "
                        + "     C.Nome AS Cliente, "
                        + "     Fu.Nome AS FuncionarioResponsavel, "
                        + "     Fo.RazaoSocial, "
                        + "     Fo.Servico AS ServicoPrestado "
                        + "FROM Legalizacao L "
                        + "     INNER JOIN Clientes C ON L.IdCliente = C.Id "
                        + "     INNER JOIN Funcionarios Fu ON L.IdFuncionario = Fu.Id "
                        + "     INNER JOIN Fornecedores Fo ON L.IdFornecedor = Fo.Id"; 

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Geral geral = new Geral();

                geral.setId(rs.getInt("Id"));
                String faseProcesso = rs.getString("FaseProcesso");
                
                if (faseProcesso.equals("Concluído")) {
                    geral.setStatus(true);
                } else {
                    geral.setStatus(false);
                }

                // Campos FKs originais
                geral.setIdCliente(rs.getInt("IdCliente"));
                geral.setIdFuncionario(rs.getInt("IdFuncionario"));
                geral.setIdFornecedor(rs.getInt("IdFornecedor"));

                // Mapeando os nomes
                geral.setNomeCliente(rs.getString("Cliente"));
                geral.setNomeFuncionario(rs.getString("FuncionarioResponsavel"));
                geral.setRazaoSocial(rs.getString("RazaoSocial"));
                geral.setServicoPrestado(rs.getString("ServicoPrestado"));
                geral.setTipoProcesso(rs.getString("TipoProcesso"));
                geral.setFaseProcesso(rs.getString("FaseProcesso"));

                lista.add(geral);
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

}
