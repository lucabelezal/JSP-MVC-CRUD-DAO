/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Cliente {

    private int id;
    private String nome;
    private String cnpj;
    private String telefone;
    private String estado;
    private String cidade;
    private String bairro;
    private String cep;
    private String endereco;
    private String usuario;
    private String email;
    private String senha;

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

    public String getCnpj() {
	return cnpj;
    }

    public void setCnpj(String cnpj) {
	this.cnpj = cnpj;
    }

    public String getTelefone() {
	return telefone;
    }

    public void setTelefone(String telefone) {
	this.telefone = telefone;
    }

    public String getEstado() {
	return estado;
    }

    public void setEstado(String estado) {
	this.estado = estado;
    }

    public String getCidade() {
	return cidade;
    }

    public void setCidade(String cidade) {
	this.cidade = cidade;
    }

    public String getBairro() {
	return bairro;
    }

    public void setBairro(String bairro) {
	this.bairro = bairro;
    }

    public String getCep() {
	return cep;
    }

    public void setCep(String cep) {
	this.cep = cep;
    }

    public String getEndereco() {
	return endereco;
    }

    public void setEndereco(String endereco) {
	this.endereco = endereco;
    }

    public String getUsuario() {
	return usuario;
    }

    public void setUsuario(String usuario) {
	this.usuario = usuario;
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

    /**
     * Realiza a verificação de todos os campos da classe
     *
     * @return Campos
     */
    public Map<String, String> verificaDados() {

	Map<String, String> campos = new HashMap<>();

	if (nome.isEmpty()) {
	    campos.put("nome", "");
	} else {
	    campos.put("nome", nome);
	}

	if (cnpj.isEmpty()) {
	    campos.put("cnpj", "");
	} else {
	    campos.put("cnpj", cnpj);
	}

	if (telefone.isEmpty()) {
	    campos.put("telefone", "");
	} else {
	    campos.put("telefone", telefone);
	}

	if (estado.isEmpty()) {
	    campos.put("estado", "");
	} else {
	    campos.put("estado", estado);
	}

	if (cidade.isEmpty()) {
	    campos.put("cidade", "");
	} else {
	    campos.put("cidade", cidade);
	}

	if (bairro.isEmpty()) {
	    campos.put("bairro", "");
	} else {
	    campos.put("bairro", bairro);
	}

	if (cep.isEmpty()) {
	    campos.put("cep", "");
	} else {
	    campos.put("cep", cep);
	}

	if (endereco.isEmpty()) {
	    campos.put("endereco", "");
	} else {
	    campos.put("endereco", endereco);
	}

	if (usuario.isEmpty()) {
	    campos.put("usuario", "");
	} else {
	    campos.put("usuario", usuario);
	}

	if (email.isEmpty()) {
	    campos.put("email", "");
	} else {
	    campos.put("email", email);
	}

	if (senha.isEmpty()) {
	    campos.put("senha", "");
	} else {
	    campos.put("senha", senha);
	}

	return campos;
    }

}
