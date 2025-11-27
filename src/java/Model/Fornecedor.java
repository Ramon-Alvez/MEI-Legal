
package Model;

/*
 * @author ramon
 */

public class Fornecedor {
    private int Id;
    private String RazaoSocial;
    private String CNPJ;
    private String Servico;
    private String Telefone;
    private String Email;

    
    // ======================
    // Métodos Get
    // ======================
    
    public int getId() {
        return Id;
    }
    public String getRazaoSocial() {
        return RazaoSocial;
    }
    public String getCNPJ() {
        return CNPJ;
    }
    public String getServico() {
        return Servico;
    }
    public String getTelefone() {
        return Telefone;
    }
    public String getEmail() {
        return Email;
    }

    
    // ======================
    // Métodos Set
    // ======================
    
    public void setId(int Id) {
        this.Id = Id;
    }
    public void setRazaoSocial(String RazaoSocial) {
        this.RazaoSocial = RazaoSocial;
    }
    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }
    public void setServico(String Servico) {
        this.Servico = Servico;
    }
    public void setTelefone(String Telefone) {
        this.Telefone = Telefone;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }

}
