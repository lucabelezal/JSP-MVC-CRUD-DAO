/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ClienteDAO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class MainController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    @SuppressWarnings("null")
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
	    Cliente cliente = new Cliente();
	    ClienteDAO clienteDAO = new ClienteDAO();
	    ArrayList<Cliente> listaCliente = new ArrayList();
	    List<Cliente> clientes;
	    List<Cliente> pesquisaCliente;
	    List<Cliente> clienteAlteraDAO;
	    Map<String, String> campos;

	    // Variáveis dos formulários
	    int id;
	    String nome;
	    String cnpj;
	    String telefone;
	    String estado;
	    String cidade;
	    String bairro;
	    String cep;
	    String endereco;
	    String usuario;
	    String email;
	    String senha;

	    // Variáveis para tratamento das mensagens de erro
	    String tituloErro = "";
	    String erro = "";

	    // Verifica qual ação deve ser tomada
	    switch (flag) {
		case "cadastrar":
		    //Recupera os valores enviados pelo formulário
		    //id = Integer.parseInt(request.getParameter("id"));
		    nome = request.getParameter("nome");
		    cnpj = request.getParameter("cnpj");
		    telefone = request.getParameter("telefone");
		    estado = request.getParameter("estado");
		    cidade = request.getParameter("cidade");
		    bairro = request.getParameter("bairro");
		    cep = request.getParameter("cep");
		    endereco = request.getParameter("endereco");
		    usuario = request.getParameter("usuario");
		    email = request.getParameter("email");
		    senha = request.getParameter("senha");

		    // Cria o objeto e e atribui os dados recebidos
		    cliente = new Cliente();
		    cliente.setNome(nome);
		    cliente.setCnpj(cnpj);
		    cliente.setTelefone(telefone);
		    cliente.setEstado(estado);
		    cliente.setCidade(cidade);
		    cliente.setBairro(bairro);
		    cliente.setCep(cep);
		    cliente.setEndereco(endereco);
		    cliente.setUsuario(usuario);
		    cliente.setEmail(email);
		    cliente.setSenha(senha);

		    // Cria um objeto para receber os campos
		    campos = new HashMap<>();

		    // Verifica o preenchimento dos campos
		    campos = cliente.verificaDados();

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

		    clienteDAO = new ClienteDAO();
		    clienteDAO.inserir(cliente);

		    // Cria um atributo para informar sobre  a inclusão
		    request.setAttribute("mensagem", clienteDAO.toString());

		    // Redireciona para a View
		    request.getRequestDispatcher("view/mensagem.jsp").
			    forward(request, response);
		    break;

		case "listar":
		    // Busca no model os dados
		    clienteDAO = new ClienteDAO();

		    // Coloca todos os clientes em uma lista
		    clientes = clienteDAO.listar();

		    // se não for encontrado nenhum registro, retorna a mensagem
		    if (clientes.size() == 0) {
			// Cria um atributo com o cliente para ser utilizado na View
			request.setAttribute("mensagem", "Não há registros para serem listados");

			// Redireciona para a View
			request.getRequestDispatcher("view/mensagem.jsp").
				forward(request, response);
		    } else {
			// Cria um atributo com o aluno para ser utilizado na View
			request.setAttribute("listaClientes", clientes);

			// Redireciona para a View
			request.getRequestDispatcher("view/lista_clientes.jsp").
				forward(request, response);
		    }

		    break;

		case "pesquisar":
		    // Cria um novo cliente
		    cliente = new Cliente();

		    /**
		     * Atribui os valores recuperados do formulário O parâmetro
		     * utilizado "pesquisa" é igual para os três campos, pois
		     * está sendo utilizado o LIKE na instrução SQL do DAO
		     */
		    cliente.setNome(request.getParameter("pesquisa"));
		    cliente.setCnpj(request.getParameter("pesquisa"));
		    cliente.setUsuario(request.getParameter("pesquisa"));

		    // Busca no model (DAO) os dados
		    clienteDAO = new ClienteDAO();

		    // Coloca todos os alunos em uma lista
		    pesquisaCliente = clienteDAO.pesquisar(cliente);

		    // se não for encontrado nenhum registro, retorna a mensagem
		    if (pesquisaCliente.size() == 0) {
			// Cria um atributo com o aluno para ser utilizado na View
			request.setAttribute("mensagem", "Não há registros para serem listados");

			// Redireciona para a View
			request.getRequestDispatcher("view/mensagem.jsp").
				forward(request, response);
		    } else {
			// Cria um atributo com o aluno para ser utilizado na View
			request.setAttribute("listaClientes", pesquisaCliente);

			// Redireciona para a View
			request.getRequestDispatcher("view/lista_clientes.jsp").
				forward(request, response);
		    }

		    break;
		case "editar":

		    /**
		     * Cria o objeto aluno e atribui o ID para pesquisa
		     */
		    cliente = new Cliente();
		    cliente.setId(Integer.parseInt(request.getParameter("idcli")));

		    // Busca no model os dados
		    clienteDAO = new ClienteDAO();

		    // Coloca todos os clientes em uma lista
		    clienteAlteraDAO = clienteDAO.pesquisar(cliente);

		    // Cria um atributo com o cliente para ser utilizado na View
		    request.setAttribute("listaClientes", clienteAlteraDAO);

		    // Redireciona para a View
		    request.getRequestDispatcher("view/editar.jsp").
			    forward(request, response);

		    break;

		case "salvar":
		    //Recupera os valores enviados pelo formulário
		    id = Integer.parseInt(request.getParameter("id"));
		    nome = request.getParameter("nome");
		    cnpj = request.getParameter("cnpj");
		    telefone = request.getParameter("telefone");
		    estado = request.getParameter("estado");
		    cidade = request.getParameter("cidade");
		    bairro = request.getParameter("bairro");
		    cep = request.getParameter("cep");
		    endereco = request.getParameter("endereco");
		    email = request.getParameter("email");
		    senha = request.getParameter("senha");

		    // Cria o objeto e e atribui os dados recebidos
		    cliente = new Cliente();
		    cliente.setId(id);
		    cliente.setNome(nome);
		    cliente.setCnpj(cnpj);
		    cliente.setTelefone(telefone);
		    cliente.setEstado(estado);
		    cliente.setCidade(cidade);
		    cliente.setBairro(bairro);
		    cliente.setCep(cep);
		    cliente.setEndereco(endereco);
		    cliente.setEmail(email);
		    cliente.setSenha(senha);

		    // Cria um objeto para receber os campos, exceto o RA que é o identificador
		    campos = new HashMap<>();

		    // Verifica o preenchimento dos campos
		    campos = cliente.verificaDados();

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
		    clienteDAO = new ClienteDAO();
		    clienteDAO.salvar(cliente);

		    // Cria um atributo para informar sobre a atualização
		    request.setAttribute("mensagem", clienteDAO.toString());

		    // Redireciona para a View
		    request.getRequestDispatcher("view/mensagem.jsp").
			    forward(request, response);

		    break;

		case "excluir":
		    /**
		     * Cria o objeto aluno e atribui o RA para pesquisa
		     */
		    cliente = new Cliente();
		    cliente.setId(Integer.parseInt(request.getParameter("idcli")));

		    // Busca no model os dados
		    clienteDAO = new ClienteDAO();

		    // Coloca todos os alunos em uma lista
		    clienteDAO.excluir(cliente);

		    // Cria um atributo com o aluno para ser utilizado na View
		    request.setAttribute("mensagem", clienteDAO.toString());

		    // Redireciona para a View
		    request.getRequestDispatcher("view/mensagem.jsp").
			    forward(request, response);

		    break;
	    }
	}
    }

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
	    Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
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
	    Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
	}
    }

}
