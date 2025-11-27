
package Model;

/*
 * @author ramon
 */

public class Funcionario {
    private int Id;
    private String Nome;
    private String CPF;
    private String Email;
    private String Telefone;

    
    // ======================
    // Métodos Get
    // ======================
    
    public int getId() {
        return Id;
    }
    public String getNome() {
        return Nome;
    }
    public String getCPF() {
        return CPF;
    }
    public String getEmail() {
        return Email;
    }
    public String getTelefone() {
        return Telefone;
    }

    
    // ======================
    // Métodos Set
    // ======================
    
    public void setId(int Id) {
        this.Id = Id;
    }
    public void setNome(String Nome) {
        this.Nome = Nome;
    }
    public void setCPF(String CPF) {
        this.CPF = CPF;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
    public void setTelefone(String Telefone) {
        this.Telefone = Telefone;
    }

}
