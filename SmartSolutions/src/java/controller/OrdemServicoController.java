/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Cliente;
import bean.OrdemServico;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClienteDAO;
import model.OrdemServicoDAO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class OrdemServicoController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        /**
         * Configuração do código de página para mostrar os caracteres
         * corretamente
         */
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Variável que receberá o valor da flag enviado pelo formulário
        String flag = request.getParameter("flag");

        try (PrintWriter out = response.getWriter()) {

            /**
             * Direciona para a página que está determinada no parâmetro do
             * método
             */
            if (flag == null) {
                request.getRequestDispatcher("index.html").
                        forward(request, response);
            }

            /**
             * Declaração das variáveis para os objetos e para receber os
             * valores enviados pelos formulários
             */
            // Objetos
            OrdemServico ordemServico = new OrdemServico();
            OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO();
            ArrayList<OrdemServico> listaOrdemServico = new ArrayList();
            List<OrdemServico> ordemServicos;
            List<OrdemServico> pesquisaOrdemServicos;
            List<OrdemServico> ordemServicoAlteraDAO;
            Map<String, String> campos;

            // Variáveis dos formulários
            int idOS;
            String dataOS;
            String tipoOS;
            String situacaoOS;
            String nomeOS;
            String cnpjOS;
            String telefoneOS;
            String enderecoOS;
            String emailOS;
            String valorOS;
            String servicoOS;

            // Variáveis para tratamento das mensagens de erro
            String tituloErro = "";
            String erro = "";

            // Verifica qual ação deve ser tomada
            switch (flag) {
                case "cadastrar":

                    break;

                case "listar":
                    // Busca no model os dados
                    ordemServicoDAO = new OrdemServicoDAO();

                    // Coloca todos os clientes em uma lista
                    ordemServicos = ordemServicoDAO.listar();

                    // se não for encontrado nenhum registro, retorna a mensagem
                    if (ordemServicos.size() == 0) {
                        // Cria um atributo com o cliente para ser utilizado na View
                        request.setAttribute("mensagem", "Não há registros para serem listados");

                        // Redireciona para a View
                        request.getRequestDispatcher("view/mensagem.jsp").
                                forward(request, response);
                    } else {
                        // Cria um atributo com o aluno para ser utilizado na View
                        request.setAttribute("listaOrdemServicos", ordemServicos);

                        // Redireciona para a View
                        request.getRequestDispatcher("view/lista_ordem_servicos.jsp").
                                forward(request, response);
                    }

                    break;

                case "pesquisar":
                    // Cria um novo cliente
                    ordemServico = new OrdemServico();

                    /**
                     * Atribui os valores recuperados do formulário O parâmetro
                     * utilizado "pesquisa" é igual para os três campos, pois
                     * está sendo utilizado o LIKE na instrução SQL do DAO
                     */
                    ordemServico.setNomeOS(request.getParameter("pesquisa"));
                    ordemServico.setCnpjOS(request.getParameter("pesquisa"));
                    ordemServico.setTipoOS(request.getParameter("pesquisa"));

                    // Busca no model (DAO) os dados
                    ordemServicoDAO = new OrdemServicoDAO();

                    // Coloca todos os alunos em uma lista
                    pesquisaOrdemServicos = ordemServicoDAO.pesquisar(ordemServico);

                    // se não for encontrado nenhum registro, retorna a mensagem
                    if (pesquisaOrdemServicos.size() == 0) {
                        // Cria um atributo com o aluno para ser utilizado na View
                        request.setAttribute("mensagem", "Não há registros para serem listados");

                        // Redireciona para a View
                        request.getRequestDispatcher("view/mensagem.jsp").
                                forward(request, response);
                    } else {
                        // Cria um atributo com o aluno para ser utilizado na View
                        request.setAttribute("listaOrdemServicos", pesquisaOrdemServicos);

                        // Redireciona para a View
                        request.getRequestDispatcher("view/lista_ordem_servicos.jsp").
                                forward(request, response);
                    }

                    break;

                case "editar":

                    ordemServico = new OrdemServico();
                    ordemServico.setIdOS(Integer.parseInt(request.getParameter("idOS")));

                    // Busca no model os dados
                    ordemServicoDAO = new OrdemServicoDAO();

                    // Coloca todos os clientes em uma lista
                    ordemServicoAlteraDAO = ordemServicoDAO.pesquisar(ordemServico);

                    // Cria um atributo com o cliente para ser utilizado na View
                    request.setAttribute("listaOrdemServicos", ordemServicoAlteraDAO);

                    // Redireciona para a View
                    request.getRequestDispatcher("view/editar_ordem_servico.jsp").
                            forward(request, response);

                    break;

                case "salvar":
                    //Recupera os valores enviados pelo formulário
                    idOS = Integer.parseInt(request.getParameter("idOS"));
                    dataOS = request.getParameter("dataOS");
                    tipoOS = request.getParameter("tipoOS");
                    situacaoOS = request.getParameter("situacaoOS");
                    nomeOS = request.getParameter("nomeOS");
                    cnpjOS = request.getParameter("cnpjOS");
                    telefoneOS = request.getParameter("telefoneOS");
                    enderecoOS = request.getParameter("enderecoOS");
                    emailOS = request.getParameter("emailOS");
                    valorOS = request.getParameter("valorOS");
                    servicoOS = request.getParameter("servicoOS");

                    // Cria o objeto e e atribui os dados recebidos
                    ordemServico = new OrdemServico();
                    ordemServico.setIdOS(idOS);
                    ordemServico.setDataOS(dataOS);
                    ordemServico.setTipoOS(tipoOS);
                    ordemServico.setSituacaoOS(situacaoOS);
                    ordemServico.setNomeOS(nomeOS);
                    ordemServico.setCnpjOS(cnpjOS);
                    ordemServico.setTelefoneOS(telefoneOS);
                    ordemServico.setEnderecoOS(enderecoOS);
                    ordemServico.setEmailOS(emailOS);
                    ordemServico.setValorOS(valorOS);
                    ordemServico.setServicoOS(servicoOS);

                    // Cria um objeto para receber os campos, exceto o RA que é o identificador
                    campos = new HashMap<>();

                    // Verifica o preenchimento dos campos
                    campos = ordemServico.verificaDados();

                    // Percorre a lista (objetos - campos) em busca dos erros
                    for (String key : campos.keySet()) {
                        if (campos.get(key).equals("")) {
                            // monta a mensagem de erro
                            tituloErro = "<h1>Campo (s) não preenchido (s)!</h1>";
                            erro = erro + "&rarr; " + String.valueOf(key) + "<br>";
                        }
                    }

                    // Se ocorreram erros, envia para página de erro
                    if (!erro.isEmpty()) {
                        request.setAttribute("mensagem", tituloErro + erro);
                        request.getRequestDispatcher("view/erro.jsp").
                                forward(request, response);
                        break;
                    }

                    /**
                     * Repassa os valores dos atributos para o objeto DAO que
                     * irá manipular os dados e gravar no banco
                     */
                    ordemServicoDAO = new OrdemServicoDAO();
                    ordemServicoDAO.salvar(ordemServico);

                    // Cria um atributo para informar sobre a atualização
                    request.setAttribute("mensagem", ordemServicoDAO.toString());

                    // Redireciona para a View
                    request.getRequestDispatcher("view/editar_ordem_servico.jsp").
                            forward(request, response);

                    break;

                case "excluir":
                    /**
                     * Cria o objeto aluno e atribui o RA para pesquisa
                     */
                    ordemServico = new OrdemServico();
                    ordemServico.setIdOS(Integer.parseInt(request.getParameter("idOS")));

                    // Busca no model os dados
                    ordemServicoDAO = new OrdemServicoDAO();

                    // Coloca todos os alunos em uma lista
                    ordemServicoDAO.excluir(ordemServico);

                    // Cria um atributo com o aluno para ser utilizado na View
                    request.setAttribute("mensagem", ordemServicoDAO.toString());

                    // Redireciona para a View
                    request.getRequestDispatcher("view/lista_ordem_servicos.jsp").
                            forward(request, response);

                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(OrdemServicoController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(OrdemServicoController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
