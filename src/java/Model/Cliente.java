
package Model;

/*
 * @author ramon
 */

import java.time.LocalDate;

public class Cliente {
    private int Id;
    private String Nome;
    private String CPF;
    private int Idade;
    private LocalDate DataCadastro;

    
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
    public int getIdade() {
        return Idade;
    }
    public LocalDate getDataCadastro() {
        return DataCadastro;
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
    public void setIdade(int Idade) {
        this.Idade = Idade;
    }
    public void setDataCadastro(LocalDate DataCadastro) {
        this.DataCadastro = DataCadastro;
    }

}
