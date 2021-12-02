package model;

import java.sql.SQLException;

public class prueba {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Conexion con=new Conexion();
		if(con.getConnection()!=null) {
			System.out.println("Conexión establecida");
		}
		else {
			System.out.println("No se pudo conectar a la DB");
		}

	}

}