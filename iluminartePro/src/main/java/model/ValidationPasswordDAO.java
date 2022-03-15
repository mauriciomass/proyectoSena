package model;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import java.util.ArrayList;

import model.Usuario;
import model.UsuarioDAO;

public class ValidationPasswordDAO {
	
	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	public Usuario consultarUsuCorreo(String correo) throws SQLException {
		Usuario u=new Usuario();
		String sql="SELECT * FROM usuario WHERE correoUsuario='"+ correo +"'";
		
		System.out.println(sql);
		
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			System.out.println(ps);
			
			while(rs.next()) {
				u.setIdUsuario(rs.getInt(1));
				
				u.setIdTipodeDocumentoFK(new TipoDocumento());
				u.getIdTipodeDocumentoFK().setNombreTipoDocumento(rs.getString(2));
				
				u.setIdRolFK(new TipoRol());
				u.getIdRolFK().setNombreRol(rs.getString(3));
				
				u.setNombreUsuario(rs.getString(4));
				u.setApellidoUsuario(rs.getString(5));
				u.setContrasenaUsuario(rs.getString(6));
				u.setNumerodeIdentificacionUsuario(rs.getString(7));
				u.setDireccionUsuario(rs.getString(8));
				u.setTelefonoUsuario(rs.getString(9));				
				u.setCorreoUsuario(rs.getString(10));
				u.setEstadoUsuario(rs.getBoolean(11));
				System.out.println("Se encontró el usuario");
				
			}
		}catch(Exception e) {
			System.out.println("Error en la consulta del usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		
		return u;
	}
	

}
