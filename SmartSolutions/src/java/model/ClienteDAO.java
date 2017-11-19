/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import bean.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Convert;

public class ClienteDAO {

    // Declaração das variáveis globais
    private Connection conexao = null;
    private String status;

    /**
     * Método construtor da classe
     *
     * @throws SQLException
     */
    public ClienteDAO() throws SQLException {
        // Retorna a conexao no momento da chamada da classe
        this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    /**
     * Realiza a inclusão de um novo registro no banco de dados
     *
     * @param cliente
     */
    @SuppressWarnings("empty-statement")
    public void inserir(Cliente cliente) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "insert into tbclientes(nomecli, cnpjcli, telefonecli, estadocli, cidadecli, bairrocli,cepcli, enderecocli, usuariocli, emailcli, senhacli) values(?,?,?,?,?,?,?,?,?,?,?)";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores
                ps.setString(1, cliente.getNome());
                ps.setString(2, cliente.getCnpj());
                ps.setString(3, cliente.getTelefone());
                ps.setString(4, cliente.getEstado());
                ps.setString(5, cliente.getCidade());
                ps.setString(6, cliente.getBairro());
                ps.setString(7, cliente.getCep());
                ps.setString(8, cliente.getEndereco());
                ps.setString(9, cliente.getUsuario());
                ps.setString(10, cliente.getEmail());
                ps.setString(11, cliente.getSenha());

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
            status = "Erro ao inserir o cliente";
        }
    }

    /**
     * Realiza a atualização de um registro específico
     *
     * @param cliente
     */
    public void salvar(Cliente cliente) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "UPDATE tbclientes SET nomecli = ?, cnpjcli = ?, telefonecli = ?, estadocli = ?, cidadecli = ?, bairrocli = ?,cepcli = ?, enderecocli = ?, usuariocli = ?, emailcli = ?, senhacli = ? where idcli = ?";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores
                ps.setString(1, cliente.getNome());
                ps.setString(2, cliente.getCnpj());
                ps.setString(3, cliente.getTelefone());
                ps.setString(4, cliente.getEstado());
                ps.setString(5, cliente.getCidade());
                ps.setString(6, cliente.getBairro());
                ps.setString(7, cliente.getCep());
                ps.setString(8, cliente.getEndereco());
                ps.setString(9, cliente.getUsuario());
                ps.setString(10, cliente.getEmail());
                ps.setString(11, cliente.getSenha());
                ps.setInt(12, cliente.getId());

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
            status = "Erro ao atualizar os dados do cliente";
        }
    }

    /**
     * Realiza a exclusão de um registro específico
     *
     * @param cliente
     */
    public void excluir(Cliente cliente) {
        try {
            // Declaração da variável para a instrução SQL
            String sql = "DELETE FROM tbclientes WHERE idcli=?";

            // Atribui os valores ao objeto ps
            try (PreparedStatement ps = conexao.prepareStatement(sql)) {
                // seta os valores
                ps.setString(1, String.valueOf(cliente.getId()));

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
            status = "Erro ao excluir o cliente";
        }
    }

    /**
     * Realiza a pesquisa no banco de dados e retorna um ou mais registros
     *
     * @param cliente
     * @return Cliente
     */
    public List<Cliente> pesquisar(Cliente cliente) {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM tbclientes WHERE cnpjcli like ? or nomecli like ? or usuariocli like ? or idcli = ?";
        try {
            PreparedStatement ps = conexao.prepareStatement(sql);
            ps.setString(1, '%' + cliente.getCnpj() + '%');
            ps.setString(2, '%' + cliente.getNome() + '%');
            ps.setString(3, '%' + cliente.getUsuario() + '%');
            ps.setString(4, String.valueOf(cliente.getId()));

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("idcli"));
                cliente.setNome(rs.getString("nomecli"));
                cliente.setCnpj(rs.getString("cnpjcli"));
                cliente.setTelefone(rs.getString("telefonecli"));
                cliente.setEstado(rs.getString("estadocli"));
                cliente.setCidade(rs.getString("cidadecli"));
                cliente.setBairro(rs.getString("bairrocli"));
                cliente.setCep(rs.getString("cepcli"));
                cliente.setEndereco(rs.getString("enderecocli"));
                cliente.setUsuario(rs.getString("usuariocli"));
                cliente.setEmail(rs.getString("emailcli"));
                cliente.setSenha(rs.getString("senhacli"));
                clientes.add(cliente);
            }
            return clientes;

        } catch (SQLException ex) {
            throw new RuntimeException("Falha ao listar os clientes.", ex);
        }
    }

    /**
     * Realiza a listagem de TODOS os registros existentes no banco de dados
     *
     * @return cliente
     */
    public List<Cliente> listar() {
        List<Cliente> clientes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tbclientes ORDER BY idcli";
            try (PreparedStatement ps = conexao.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    Cliente cliente = new Cliente();
                    cliente.setId(rs.getInt("idcli"));
                    cliente.setNome(rs.getString("nomecli"));
                    cliente.setCnpj(rs.getString("cnpjcli"));
                    cliente.setTelefone(rs.getString("telefonecli"));
                    cliente.setEstado(rs.getString("estadocli"));
                    cliente.setCidade(rs.getString("cidadecli"));
                    cliente.setBairro(rs.getString("bairrocli"));
                    cliente.setCep(rs.getString("cepcli"));
                    cliente.setEndereco(rs.getString("enderecocli"));
                    cliente.setUsuario(rs.getString("usuariocli"));
                    cliente.setEmail(rs.getString("emailcli"));
                    cliente.setSenha(rs.getString("senhacli"));

                    clientes.add(cliente);
                }
            }
            return clientes;

        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Falha ao listar os clientes.", ex);
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
