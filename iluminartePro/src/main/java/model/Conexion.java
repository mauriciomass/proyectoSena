/*package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
	
	private static final String CONTROLADOR = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/db_iluminarte";
	private static final String USUARIO = "root";
	private static final String CLAVE = "";
	

	public Connection conectar() {		
		Connection conexion = null;
				
		try { 
			Class.forName(CONTROLADOR);			
			conexion = DriverManager.getConnection(URL,USUARIO,CLAVE);			
			System.out.print("Conexión OK");
			
		}catch (ClassNotFoundException e) {
			System.out.print("Error al cargar el controlador");
			e.printStackTrace();
			
		}catch (SQLException e) {
			System.out.print("Error en la conexión");
			e.printStackTrace();
		}
		
		return conexion;
	}
	
	public static void main(String[] args) {
		

	}

}*/



/*package model;

import java.sql.*;

public class Conexion {
	
	private static final String bbdd="jdbc:mysql://localhost:3306/db_iluminarte";
	private static final String usuario="root";
	private static final String clave="";
	private static Connection con;
	
	
	public static Connection conectar() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(bbdd,usuario,clave);
			 System.out.println("Conexi�n Exitosa");
		}catch(Exception e) {
			System.out.println("Error de conexi�n a la base de datos "+e.getMessage().toString());			
		}
		return con;
		
	}
}*/

package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	
	//Declarar variables, atributos
	private static final String bbdd="jdbc:mysql://localhost:3306/db_iluminarte";
	private static final String usuario="root";
	private static final String clave="";
	private static Connection con;

	public static Connection conectar() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(bbdd,usuario,clave);
			 System.out.println("Conexión Exitosa");
		}catch(Exception e) {
			System.out.println("Error de conexión a la base de datos "+e.getMessage().toString());			
		}
		return con;
	}
}













