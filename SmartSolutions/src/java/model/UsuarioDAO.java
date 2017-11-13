/**
 * Arquivo: UsuarioDAO.java
 *
 */
package model;

import bean.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Edson Melo de Souza (prof.edson.melo@gmail.com)
 * @since 20/10/2016, 14:26:20
 * @version 1.0
 */
public class UsuarioDAO {

    private final Connection conexao;

    public UsuarioDAO() throws SQLException {
	this.conexao = ConnectionFactory.getInstance().getConnection();
    }

    public List<Usuario> login(Usuario u) throws SQLException {
	String sql = "SELECT * FROM tbusuarios WHERE login=? AND senha =?";

	PreparedStatement ps = conexao.prepareStatement(sql);
	ps.setString(1, u.getEmail());
	ps.setString(2, u.getSenha());

	ResultSet rs = ps.executeQuery();

	List<Usuario> rsUsuario = new ArrayList();
	while (rs.next()) {
	    Usuario usuario = new Usuario();
	    usuario.setId(rs.getInt("iduser"));
	    usuario.setNome(rs.getString("usuario"));
	    usuario.setEmail(rs.getString("login"));
	    System.out.println(usuario.getNome());
	    rsUsuario.add(usuario);
	}

	return rsUsuario;

    }
}
