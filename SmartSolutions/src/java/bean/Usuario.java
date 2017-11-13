/**
 * Arquivo: Usuario.java
 *
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author Edson Melo de Souza (prof.edson.melo@gmail.com)
 * @since 20/10/2016, 14:25:15
 * @version 1.0
 */
public class Usuario implements Serializable {

    private int id;
    private String nome;
    private String email;
    private String senha;

    public Usuario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
