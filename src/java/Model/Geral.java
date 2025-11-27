package Model;

/*
 * @author ramon
 */

public class Geral {

    // IDs
    private int Id;
    // IDs Herdados via FK
    private int IdCliente;
    private int IdFuncionario;
    private int IdFornecedor;
    private int IdLegalizacao;

    // Parâmetros herdados via FK
    private String RazaoSocial;
    private String NomeCliente;
    private String ServicoPrestado;
    private String NomeFuncionario;
    private String TipoProcesso;
    private String FaseProcesso;
    private Boolean Status;

    // ======================
    // Métodos Get
    // ======================
    
    // IDs
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
    public int getIdLegalizacao() {
        return IdLegalizacao;
    }

    
    // Parâmetros herdados via FK
    
    public String getNomeCliente() {
        return NomeCliente;
    }
    public String getNomeFuncionario() {
        return NomeFuncionario;
    }
    public String getRazaoSocial() {
        return RazaoSocial;
    }
    public String getServicoPrestado() {
        return ServicoPrestado;
    }
    public String getTipoProcesso() {
        return TipoProcesso;
    }
    public String getFaseProcesso() {
        return FaseProcesso;
    }
    public Boolean getStatus() {
        return Status;
    }

    // ======================
    // Métodos Set
    // ======================
    
    // IDs
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
    public void setIdLegalizacao(int IdLegalizacao) {
        this.IdLegalizacao = IdLegalizacao;
    }

    
    // Parâmetros herdados via FK
    
    public void setNomeCliente(String nomeCliente) {
        this.NomeCliente = nomeCliente;
    }
    public void setNomeFuncionario(String nomeFuncionario) {
        this.NomeFuncionario = nomeFuncionario;
    }
    public void setRazaoSocial(String RazaoSocial) {
        this.RazaoSocial = RazaoSocial;
    }
    public void setServicoPrestado(String ServicoPrestado) {
        this.ServicoPrestado = ServicoPrestado;
    }
    public void setTipoProcesso(String TipoProcesso) {
        this.TipoProcesso = TipoProcesso;
    }
    public void setFaseProcesso(String FaseProcesso) {
        this.FaseProcesso = FaseProcesso;
    }
    public void setStatus(Boolean Status) {
        this.Status = Status;
    }
}
