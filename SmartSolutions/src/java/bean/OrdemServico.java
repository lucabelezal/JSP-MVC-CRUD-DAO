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
    private String dataOS;
    private String tipoOS;
    private String situacaoOS;
    private String nomeOS;
    private String cnpjOS;
    private String telefoneOS;
    private String enderecoOS;
    private String emailOS;
    private String valorOS;
    private String servicoOS;

    public int getIdOS() {
        return idOS;
    }

    public void setIdOS(int idOS) {
        this.idOS = idOS;
    }

    public String getDataOS() {
        return dataOS;
    }

    public void setDataOS(String dataOS) {
        this.dataOS = dataOS;
    }

    public String getTipoOS() {
        return tipoOS;
    }

    public void setTipoOS(String tipoOS) {
        this.tipoOS = tipoOS;
    }

    public String getSituacaoOS() {
        return situacaoOS;
    }

    public void setSituacaoOS(String situacaoOS) {
        this.situacaoOS = situacaoOS;
    }

    public String getNomeOS() {
        return nomeOS;
    }

    public void setNomeOS(String nomeOS) {
        this.nomeOS = nomeOS;
    }

    public String getCnpjOS() {
        return cnpjOS;
    }

    public void setCnpjOS(String cnpjOS) {
        this.cnpjOS = cnpjOS;
    }

    public String getTelefoneOS() {
        return telefoneOS;
    }

    public void setTelefoneOS(String telefoneOS) {
        this.telefoneOS = telefoneOS;
    }

    public String getEnderecoOS() {
        return enderecoOS;
    }

    public void setEnderecoOS(String enderecoOS) {
        this.enderecoOS = enderecoOS;
    }

    public String getEmailOS() {
        return emailOS;
    }

    public void setEmailOS(String emailOS) {
        this.emailOS = emailOS;
    }

    public String getValorOS() {
        return valorOS;
    }

    public void setValorOS(String valorOS) {
        this.valorOS = valorOS;
    }

    public String getServicoOS() {
        return servicoOS;
    }

    public void setServicoOS(String servicoOS) {
        this.servicoOS = servicoOS;
    }

    /**
     * Realiza a verificação de todos os campos da classe
     *
     * @return Campos
     */
    public Map<String, String> verificaDados() {

        Map<String, String> campos = new HashMap<>();

        if (cnpjOS.isEmpty()) {
            campos.put("cnpjOS", "");
        } else {
            campos.put("cnpjOS", cnpjOS);
        }

        return campos;
    }

}
