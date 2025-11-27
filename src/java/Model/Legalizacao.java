package Model;

/*
 * @author ramon
 */
public class Legalizacao {

    // ID PK
    private int Id;
    // IDs FK
    private int IdCliente;
    private int IdFuncionario;
    private int IdFornecedor;

    // Parâmetros Originais
    private String TipoProcesso;
    private String FaseProcesso;

    // Parâmetros herdados via FK
    private String nomeCliente;
    private String nomeFuncionario;
    private String ServicoPrestado;
    private String RazaoSocial;

    // ======================
    // Métodos Get
    // ======================
    public int getId() {
        return Id;
    }
    public int getIdCliente() {
        return IdCliente;
    }
    public int getIdFuncionario() {
        return IdFuncionario;
    }
    public int getIdFornecedor() {
        return IdFornecedor;
    }

    
    // Demais Parâmetros
    public String getTipoProcesso() {
        return TipoProcesso;
    }
    public String getFaseProcesso() {
        return FaseProcesso;
    }

    
    // Parâmetros herdados via FK
    public String getNomeCliente() {        // Cliente
        return nomeCliente;
    }
    public String getNomeFuncionario() {    // Funcionários
        return nomeFuncionario;
    }
    public String getRazaoSocial() {        // Fornecedores
        return RazaoSocial;
    }
    public String getServicoPrestado() {    // Fornecedores
        return ServicoPrestado;
    }

    // ======================
    // Métodos Set
    // ======================
    public void setId(int Id) {
        this.Id = Id;
    }
    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }
    public void setIdFuncionario(int IdFuncionario) {
        this.IdFuncionario = IdFuncionario;
    }
    public void setIdFornecedor(int IdFornecedor) {
        this.IdFornecedor = IdFornecedor;
    }
    
    
    // Demais Parâmetros
    public void setTipoProcesso(String TipoProcesso) {
        this.TipoProcesso = TipoProcesso;
    }
    public void setFaseProcesso(String FaseProcesso) {
        this.FaseProcesso = FaseProcesso;
    }


    // Parâmetros herdados via FK
    public void setNomeCliente(String nomeCliente) {            // Cliente
        this.nomeCliente = nomeCliente;
    }
    public void setNomeFuncionario(String nomeFuncionario) {    // Funcionários
        this.nomeFuncionario = nomeFuncionario;
    }
    public void setRazaoSocial(String RazaoSocial) {            // Fornecedores
        this.RazaoSocial = RazaoSocial;
    }
    public void setServicoPrestado(String ServicoPrestado) {    // Fornecedores
        this.ServicoPrestado = ServicoPrestado;
    }
}
