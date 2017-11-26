/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.Cliente;
import bean.OrdemServico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class OrdemServicoDAO {

    // Declaração das variáveis globais
    private Connection conexao = null;
    private String status;

    /**
     * Método construtor da classe
     *
     * @throws SQLException
     */
    public OrdemServicoDAO() throws SQLException {
        // Retorna a conexao no momento da chamada da classe
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    /**
     * Realiza a inclusão de um novo registro no banco de dados
     *
     * @param ordemServico
     */
    @SuppressWarnings("empty-statement")
    public void inserir(OrdemServico ordemServico) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "insert into tbos(tipo, situacao, equipamento, defeito, servico, tecnico, valor, idcli) values(?,?,?,?,?,?,?)";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores

//                ps.setString(1, ordemServico.getNome());
//                ps.setString(2, ordemServico.getCnpj());
//                ps.setString(3, ordemServico.getTelefone());
//                ps.setString(4, ordemServico.getEstado());
//                ps.setString(5, ordemServico.getCidade());
//                ps.setString(6, ordemServico.getBairro());
//                ps.setString(7, ordemServico.getCep());
//                ps.setString(8, ordemServico.getEndereco());
//                ps.setString(9, ordemServico.getUsuario());
//                ps.setString(10, ordemServico.getEmail());
//                ps.setString(11, ordemServico.getSenha());
                // Executa o sql (execute)
                ps.execute();

                // Fecha o ps
                ps.close();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna o status da inserção
            status = "Inserido com Sucesso!";

        } catch (SQLException ex) {
            // Lança um erro novo personalizado
            status = "Erro ao inserir o Ordem de Serviço";
        }
    }

    /**
     * Realiza a atualização de um registro específico
     *
     * @param ordemServico
     */
    public void salvar(OrdemServico ordemServico) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "UPDATE tborcamentosite SET tipoorc = ?, situacaoorc = ?, "
                    + "nomeorc = ?,cnpjorc = ?, "
                    + "telefoneorc = ?, enderecoorc = ?, "
                    + "emailorc = ?, valororc = ?, servicoorc = ? "
                    + "WHERE idorcamento = ?  ";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores
                ps.setString(1, ordemServico.getTipoOS());
                ps.setString(2, ordemServico.getSituacaoOS());
                ps.setString(3, ordemServico.getNomeOS());
                ps.setString(4, ordemServico.getCnpjOS());
                ps.setString(5, ordemServico.getTelefoneOS());
                ps.setString(6, ordemServico.getEnderecoOS());
                ps.setString(7, ordemServico.getEmailOS());
                ps.setString(8, ordemServico.getValorOS());
                ps.setString(9, ordemServico.getServicoOS());
                ps.setInt(10, ordemServico.getIdOS());

                // Executa o sql (executeUpdate)
                ps.executeUpdate();

                // Fecha o ps
                ps.close();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna o status da inserção
            status = "Atualizado com Sucesso!";

        } catch (SQLException ex) {
            // Lança um erro novo personalizado
            status = "Erro ao atualizar os dados da Ordem de Servico";
        }
    }

    /**
     * Realiza a exclusão de um registro específico
     *
     * @param ordemServico
     */
    public void excluir(OrdemServico ordemServico) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "DELETE FROM tborcamentosite WHERE idorcamento=?";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores
                ps.setString(1, String.valueOf(ordemServico.getIdOS()));

                // Executa o sql (executeUpdate)
                ps.executeUpdate();

                // Fecha o ps
                ps.close();
            }

            // Fecha a conexão
            conexao.close();

            // Retorna o status da inserção
            status = "Excluído com Sucesso!";

        } catch (SQLException ex) {
            // Lança um erro novo personalizado
            status = "Erro ao excluir o Ordem deServico";
        }
    }

    /**
     * Realiza a pesquisa no banco de dados e retorna um ou mais registros
     *
     * @param ordemServico
     * @return OrdemServico
     */
    public List<OrdemServico> pesquisar(OrdemServico ordemServico) {
        List<OrdemServico> ordemServicos = new ArrayList<>();
        String sql = "SELECT * FROM tborcamentosite WHERE cnpjorc like ? or nomeorc like ? or situacaoorc like ? or idorcamento = ?";
        try {
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, '%' + ordemServico.getCnpjOS() + '%');
            ps.setString(2, '%' + ordemServico.getNomeOS() + '%');
            ps.setString(3, '%' + ordemServico.getSituacaoOS() + '%');
            ps.setString(4, String.valueOf(ordemServico.getIdOS()));

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ordemServico = new OrdemServico();

                ordemServico.setIdOS(rs.getInt("idorcamento"));
                ordemServico.setDataOS(rs.getString("data_os_orc"));
                ordemServico.setTipoOS(rs.getString("tipoorc"));
                ordemServico.setSituacaoOS(rs.getString("situacaoorc"));
                ordemServico.setNomeOS(rs.getString("nomeorc"));
                ordemServico.setCnpjOS(rs.getString("cnpjorc"));
                ordemServico.setTelefoneOS(rs.getString("telefoneorc"));
                ordemServico.setEnderecoOS(rs.getString("enderecoorc"));
                ordemServico.setEmailOS(rs.getString("emailorc"));
                ordemServico.setValorOS(rs.getString("valororc"));
                ordemServico.setServicoOS(rs.getString("servicoorc"));

                ordemServicos.add(ordemServico);
            }
            return ordemServicos;

        } catch (SQLException ex) {
            throw new RuntimeException("Falha ao listar os Ordem de Servicos.", ex);
        }
    }

    /**
     * Realiza a listagem de TODOS os registros existentes no banco de dados
     *
     * @return OrdemServico
     */
    public List<OrdemServico> listar() {
        List<OrdemServico> ordemServicos = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tborcamentosite ORDER BY idorcamento";
            try (PreparedStatement ps = conexao.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    OrdemServico ordemServico = new OrdemServico();

                    ordemServico.setIdOS(rs.getInt("idorcamento"));
                    ordemServico.setDataOS(rs.getString("data_os_orc"));
                    ordemServico.setTipoOS(rs.getString("tipoorc"));
                    ordemServico.setSituacaoOS(rs.getString("situacaoorc"));
                    ordemServico.setNomeOS(rs.getString("nomeorc"));
                    ordemServico.setCnpjOS(rs.getString("cnpjorc"));
                    ordemServico.setTelefoneOS(rs.getString("telefoneorc"));
                    ordemServico.setEnderecoOS(rs.getString("enderecoorc"));
                    ordemServico.setEmailOS(rs.getString("emailorc"));
                    ordemServico.setValorOS(rs.getString("valororc"));
                    ordemServico.setServicoOS(rs.getString("servicoorc"));

                    ordemServicos.add(ordemServico);
                }
            }
            return ordemServicos;

        } catch (SQLException ex) {
            Logger.getLogger(OrdemServicoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Falha ao listar as ordem de Servicos.", ex);
        }
    }

    /**
     * Método que retorna o status da operação realizada
     *
     * @return String
     */
    @Override
    public String toString() {
        return status;
    }

}
