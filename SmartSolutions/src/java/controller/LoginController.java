/*
 * Apenas para fins educacionais.
 * Citar a fonte em caso de uso para terceiros
 */
package controller;

import bean.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.UsuarioDAO;

/**
 *
 * @author Edson Melo de Souza (prof.edson.melo@gmail.com)
 */
public class LoginController extends HttpServlet {

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
	PrintWriter out = response.getWriter();

	HttpSession session = request.getSession();

	if (session.isNew() || request.getParameter("btLogin").contains("LoginController")) {
	    try {
		UsuarioDAO uDao = new UsuarioDAO();
		Usuario u = new Usuario();
		u.setEmail(request.getParameter("email"));
		u.setSenha(request.getParameter("senha"));

		List lstUsuario = new ArrayList();
		lstUsuario = uDao.login(u);

		if (lstUsuario.isEmpty()) {
		    request.setAttribute("mensagem", "Usuário não encontrado!");
		    request.getRequestDispatcher("view/mensagem.jsp").forward(request, response);
		} else {
		    session.setAttribute("objUsuario", lstUsuario);
		    request.getRequestDispatcher("view/menu.jsp").forward(request, response);
		}

	    } catch (SQLException ex) {
		Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
	    }
	} else {
	    request.getRequestDispatcher("view/menu.jsp").forward(request, response);
	}
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	HttpSession session = request.getSession();

	if (session.isNew()) {
	    request.getRequestDispatcher("login.html").forward(request, response);
	} else {
	    request.getRequestDispatcher("view/menu.jsp").forward(request, response);
	}
    }
}
