package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VendedorDAO {

	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	
	
	
public int traeIdVendedor(String codVendedor) throws SQLException {
		
		Vendedor ve = new Vendedor();
		
		sql="SELECT idVendedor FROM vendedor "
				+ "JOIN usuario ON vendedor.idUsuarioFK=usuario.idUsuario "
				+ "WHERE usuario.numeroIdentificacionUsuario = '" + codVendedor + "'"  ;
		
		int VendTotal =0;
		
	try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println(ps);
			
			while(rs.next()) {
				
			 
			  
			  VendTotal=(rs.getInt(1));
			  
			  //total=rs.getInt("cant");
			  
			 				
			}
	
	}catch(Exception e) {
		System.out.println("Error en la consulta del vendedor "+e.getMessage());
	}
	finally {
		con.close();
	}
		
		return VendTotal;
		
		
 }	
}
