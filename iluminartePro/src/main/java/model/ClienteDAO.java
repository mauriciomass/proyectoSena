package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

public class ClienteDAO {
	
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	
	
	
public int traeIdCliente(String codCliente) throws SQLException {
		
		Cliente cl = new Cliente();
		
		sql="SELECT idCliente FROM cliente "
				+ "JOIN usuario ON cliente.idUsuarioFK=usuario.idUsuario "
				+ "WHERE usuario.numeroIdentificacionUsuario = '" + codCliente + "'"  ;
		
		int clientTotal =0;
		
	try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println(ps);
			
			while(rs.next()) {
				
			 // cl.setIdCliente(rs.getInt(1));
			  
			  clientTotal=(rs.getInt(1));
			  
			  //total=rs.getInt("cant");
			  
			 				
			}
	
	}catch(Exception e) {
		System.out.println("Error en la consulta del cliente "+e.getMessage());
	}
	finally {
		con.close();
	}
		
		return clientTotal;
		
		
 }	
	

}
