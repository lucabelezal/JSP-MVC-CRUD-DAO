package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe de conexão (fábrica de conexões)
 */
public class ConnectionFactory {

    // variáveis da conexão
    private final String driver = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/dbsmartsolutions?zeroDateTimeBehavior=convertToNull";
    private final String usuario = "root";
    private final String senha = "root";
    private static ConnectionFactory connectionFactory = null;

    /**
     * Método construtor da classe
     *
     * @throws SQLException
     */
    private ConnectionFactory() throws SQLException {
	try {
	    // Configura o driver para a conexão
	    Class.forName(driver);
	} catch (ClassNotFoundException e) {
	    throw new SQLException("driver");
	}
    }

    /**
     * Método que retorna uma conexão
     *
     * @return
     * @throws SQLException
     */
    public Connection getConnection() throws SQLException {
	// Variável para receber a conexão
	Connection conn = null;

	try {
	    conn = DriverManager.getConnection(url, usuario, senha);
	} catch (SQLException e) {
	    throw new SQLException(String.valueOf(e.getMessage()));
	}

	// Retorna uma conexão caso ocorra sucesso
	return conn;
    }

    /**
     * Método que retorna uma instância da conexão
     *
     * @return
     * @throws SQLException
     */
    public static ConnectionFactory getInstance() throws SQLException {
	if (connectionFactory == null) {
	    connectionFactory = new ConnectionFactory();
	}
	return connectionFactory;
    }
}
