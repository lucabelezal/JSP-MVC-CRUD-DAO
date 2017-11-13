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
public class OrdemServico {

    private int idOS;
    private int idCliente;
    private String dataOS;
    private String equipamento;
    private String defeito;
    private String servico;
    private String tecnico;
    private String valor;

    public int getIdOS() {
	return idOS;
    }

    public void setIdOS(int idOS) {
	this.idOS = idOS;
    }

    public int getIdCliente() {
	return idCliente;
    }

    public void setIdCliente(int idCliente) {
	this.idCliente = idCliente;
    }

    public String getDataOS() {
	return dataOS;
    }

    public void setDataOS(String dataOS) {
	this.dataOS = dataOS;
    }

    public String getEquipamento() {
	return equipamento;
    }

    public void setEquipamento(String equipamento) {
	this.equipamento = equipamento;
    }

    public String getDefeito() {
	return defeito;
    }

    public void setDefeito(String defeito) {
	this.defeito = defeito;
    }

    public String getServico() {
	return servico;
    }

    public void setServico(String servico) {
	this.servico = servico;
    }

    public String getTecnico() {
	return tecnico;
    }

    public void setTecnico(String tecnico) {
	this.tecnico = tecnico;
    }

    public String getValor() {
	return valor;
    }

    public void setValor(String valor) {
	this.valor = valor;
    }

    /**
     * Realiza a verificação de todos os campos da classe
     *
     * @return Campos
     */
    public Map<String, String> verificaDados() {

	Map<String, String> campos = new HashMap<>();

	if (equipamento.isEmpty()) {
	    campos.put("equipamento", "");
	} else {
	    campos.put("equipamento", equipamento);
	}

	return campos;
    }

}
