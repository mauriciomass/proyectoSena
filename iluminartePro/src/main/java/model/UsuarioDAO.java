package model;

import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;




public class UsuarioDAO {
	
	

	Connection con; //objeto de conexión
	PreparedStatement ps; //objeto para sentencias preparadas
	ResultSet rs; //objeto para almacenar consultas
	String sql=null; //variable para guardar sentencias
	
	Conexion c=new Conexion();
	
	int r;
	
	public Usuario validarUsuario(String correo, String passw) throws SQLException {
		Usuario u=new Usuario();
		sql="SELECT idUsuario,nombreUsuario,apellidoUsuario,correoUsuario,numeroIdentificacionUsuario,direccionUsuario,telefonoUsuario,estadoUsuario,idRolFK,nombreRol,contrasenaUsuario,idTipoDocumentoFK,nombreTipoDocumento " 
		+ "FROM usuario " 
		+ "JOIN tiporol ON tiporol.idRol=usuario.idRolFK "
		+ "JOIN tipodocumento ON tipodocumento.idTipoDocumento = usuario.idTipoDocumentoFK "
		+ "WHERE correoUsuario=? AND contrasenaUsuario=?";
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			ps.setString(1, correo);
			ps.setString(2, passw);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				u.setIdUsuario(rs.getInt(1));
				u.setNombreUsuario(rs.getString(2));
				u.setApellidoUsuario(rs.getString(3));
				u.setCorreoUsuario(rs.getString(4));
				u.setNumerodeIdentificacionUsuario(rs.getString(5));
				u.setDireccionUsuario(rs.getString(6));
				u.setTelefonoUsuario(rs.getString(7));
				u.setEstadoUsuario(rs.getBoolean(8));
				u.setIdRolFK(new TipoRol());
				u.getIdRolFK().setIdRol(rs.getInt(9));
				u.getIdRolFK().setNombreRol(rs.getString(10));
				u.setContrasenaUsuario(rs.getString(11));
				u.setIdTipodeDocumentoFK(new TipoDocumento());
				u.getIdTipodeDocumentoFK().setIdTipoDocumento(rs.getInt(12));
				
				u.getIdTipodeDocumentoFK().setNombreTipoDocumento(rs.getString(13));
				
				System.out.println("Se encontró el usuario validado");
				
			}
		}catch(Exception e) {
			System.out.println("Error en la consulta del usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		
		return u;
	}
	
	public List Listar() throws SQLException {
		List<Usuario> usu=new ArrayList<>();
		sql="SELECT idUsuario, nombreTipoDocumento,nombreRol, nombreUsuario, apellidoUsuario,contrasenaUsuario , "
				+ "numeroIdentificacionUsuario,direccionUsuario, telefonoUsuario, correoUsuario, estadoUsuario  " 
				+ "FROM usuario JOIN tiporol ON tiporol.idRol=usuario.idRolFK JOIN tipodocumento ON tipodocumento.idTipoDocumento = usuario.idTipoDocumentoFK";
		
		try {
			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta
			while(rs.next()) {
				Usuario u=new Usuario();
				//Escribir en el setter de cada objeto
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
				
				usu.add(u);
			}
			ps.close(); //cerrar sentencia
			System.out.println("consulta exitosa");
		}catch(Exception e) {
			System.out.println("No existen usuarios definidos"+e.getMessage());
		}finally {
			con.close(); //cerrar conexión
		}
		return usu;
	}
	public int registrar(Usuario us) throws SQLException {
		sql="INSERT INTO usuario (idtipoDocumentoFK,idRolFK, nombreUsuario, apellidoUsuario,contrasenaUsuario,numeroIdentificacionUsuario,direccionUsuario, telefonoUsuario, correoUsuario, estadoUsuario) VALUES (?,?,?,?,?,?,?,?,?,?)";
		try {
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			
			ps.setInt(1,us.getIdTipodeDocumentoFK().getIdTipoDocumento());
			ps.setInt(2,us.getIdRolFK().getIdRol());
			
			ps.setString(3, us.getNombreUsuario());
			ps.setString(4, us.getApellidoUsuario());
			ps.setString(5, us.getContrasenaUsuario());
			ps.setString(6, us.getNumerodeIdentificacionUsuario());
			ps.setString(7, us.getDireccionUsuario());
			ps.setString(8, us.getTelefonoUsuario());
			ps.setString(9, us.getCorreoUsuario());
			ps.setBoolean(10, us.isEstadoUsuario());
			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se registró un usuario");
			
		}catch(Exception e) {
			System.out.println("Error en el registro del usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}

	
	public void eliminar(int id) throws SQLException {
		
		sql="SELECT idRolFK FROM usuario WHERE idUsuario ="+id;
		
		int consulRol = 0;
		
		System.out.println(sql);
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta

					
			while(rs.next()) {
				
				consulRol=rs.getInt(1);
				System.out.println("Tipo de rol del usuario es "+consulRol);
			}			
			ps.close();
			
			if(consulRol == 1) {
				
				String sql1="DELETE administrador.* FROM administrador INNER JOIN usuario ON usuario.idUsuario=administrador.idUsuarioFK WHERE idUsuarioFK="+id;
				
				System.out.println(sql1);
				
				con=c.conectar();
				ps=con.prepareStatement(sql1);
				ps.executeUpdate();
				ps.close();
				System.out.println("Se eliminó el usuario administrador");
			}
			
			else if(consulRol == 2) {
				
				String sql2="DELETE vendedor.* FROM vendedor INNER JOIN usuario ON usuario.idUsuario=vendedor.idUsuarioFK WHERE idUsuarioFK="+id;
				
				System.out.println(sql2);
				
				con=c.conectar();
				ps=con.prepareStatement(sql2);
				ps.executeUpdate();
				ps.close();
				System.out.println("Se eliminó el usuario vendedor");
			}
			
			else if(consulRol == 3) {
				
				String sql3="DELETE cliente.* FROM cliente INNER JOIN usuario ON usuario.idUsuario=cliente.idUsuarioFK WHERE idUsuarioFK="+id;
				
				System.out.println(sql3);
				
				con=c.conectar();
				ps=con.prepareStatement(sql3);
				ps.executeUpdate();
				ps.close();
				System.out.println("Se eliminó el usuario cliente");
			}
			
			
			String sqlFinal="DELETE FROM usuario WHERE idUsuario="+id;
			
			System.out.println(sqlFinal);
			
			con=c.conectar();
			ps=con.prepareStatement(sqlFinal);
			ps.executeUpdate();
			ps.close();			
			System.out.println("Se eliminó el usuario");
		}catch(Exception e) {
			System.out.println("Error en la eliminación del registro "+e.getMessage());
		}
		finally {
			con.close();
		}
		
	
	}
	
	public Usuario consultaporId(int id) throws SQLException {
		Usuario u=new Usuario();
		sql="SELECT * FROM usuario WHERE idUsuario="+id;
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
	
	public int actualizar(Usuario us) throws SQLException {
		sql="UPDATE usuario SET idtipoDocumentoFK=?,idRolFK=?, nombreUsuario=?, apellidoUsuario=?,contrasenaUsuario=?,numeroIdentificacionUsuario=?,direccionUsuario=?, telefonoUsuario=?, correoUsuario=?, estadoUsuario=? "+
				"WHERE idUsuario="+us.getIdUsuario();
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setInt(1, us.getIdTipodeDocumentoFK().getIdTipoDocumento());
			ps.setInt(2, us.getIdRolFK().getIdRol());
			ps.setString(3, us.getNombreUsuario());
			ps.setString(4, us.getApellidoUsuario());
			ps.setString(5, us.getContrasenaUsuario());
			ps.setString(6, us.getNumerodeIdentificacionUsuario());			
			ps.setString(7, us.getDireccionUsuario());
			ps.setString(8, us.getTelefonoUsuario());
			ps.setString(9, us.getCorreoUsuario());
			ps.setBoolean(10, us.isEstadoUsuario());


			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó un usuario");
		}catch(Exception e) {
			System.out.println("Error en la actualización del usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	public int changePassword(Usuario us) throws SQLException {
		sql="UPDATE usuario SET contrasenaUsuario=? "+
				"WHERE idUsuario="+us.getIdUsuario();
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			ps.setString(1, us.getContrasenaUsuario());
			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			ps.close();//cerrar sentencia
			System.out.println("Se actualizó la contraseña del usuario");
		}catch(Exception e) {
			System.out.println("Error en la actualización la contraseña del usuario"+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}

	
	
	public int cambiarEstado(Boolean es, int id) throws SQLException {
		sql="UPDATE usuario SET estadoUsuario=" + es +
				" WHERE idUsuario=" + id;
		try {
			
			con=c.conectar();//abrir conexión
			ps=con.prepareStatement(sql); //preparación
			/*ps.setBoolean(1, u.isEstadoUsuario());*/
			
			
			System.out.println(ps);
			ps.executeUpdate();//Ejecucución sentencia
			
			/*ps.close();//cerrar sentencia*/
			
			System.out.println("Se actualizó el estado del usuario");
		}catch(Exception e) {
			System.out.println("Error en la actualización del estado usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		return r;
	}
	
	
	public int validarCorreo(String correo) throws SQLException {
	 sql="SELECT COUNT(*) AS cant FROM usuario WHERE correoUsuario='"+ correo +"'";
		
		int total=0;
		try {
			con=c.conectar();
			ps=con.prepareStatement(sql);
			System.out.println("La consulta es " + ps);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				total=rs.getInt("cant");
			}
			
			System.out.println("El total de registros es "+total);
		}catch(Exception e) {
			System.out.println("Error en la verificación del usuario "+e.getMessage());
		}
		finally {
			con.close();
		}
		return total;
	}
	
	public int validarNumeroDocumento(String numeroDocumento) throws SQLException {
		 sql="SELECT COUNT(*) AS cant FROM usuario WHERE numeroIdentificacionUsuario='"+ numeroDocumento +"'";
			
			int total=0;
			try {
				con=c.conectar();
				ps=con.prepareStatement(sql);
				System.out.println("La consulta es " + ps);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					total=rs.getInt("cant");
				}
				
				System.out.println("El total de registros es "+total);
			}catch(Exception e) {
				System.out.println("Error en la verificación del usuario "+e.getMessage());
			}
			finally {
				con.close();
			}
			return total;
		}
	
	
	public Usuario buscar(String numero) throws SQLException {
		Usuario u=new Usuario();
		sql="SELECT * FROM usuario WHERE numeroIdentificacionUsuario="+numero;
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
	
	public String MD5(String md5)
	{
		try {
			
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			
			byte[] array =md.digest(md5.getBytes());
			
			StringBuffer sb = new StringBuffer();
			
			for (int i = 0;i < array.length;i++) {
				
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
				
			}
			
			return sb.toString();
		}catch(java.security.NoSuchAlgorithmException e) {
			
		}
		return null;

	}
	
	public int registrarPersona (int ti) throws SQLException {
		
     System.out.println("Ingresa a registrarPersona");
     
		int maxIdUsuario = 0;
		sql="select max(idUsuario) from usuario";

			con=c.conectar(); //abrir conexion
			ps=con.prepareStatement(sql); //preparando la sentencia
			//ejecutamos la consulta y guardamos en el objeto rs
			rs=ps.executeQuery();
			//procesamos el resultado de la consulta

					
			while(rs.next()) {
				
				maxIdUsuario=rs.getInt(1);
				
			}
			ps.close(); //cerrar sentencia
			System.out.println("maximo id Usuario " + maxIdUsuario);   
     
		
			
		
				if (ti == 3) {
					
					System.out.println("Tipo " + ti);				
					
				     String	sql1="INSERT INTO cliente (idUsuarioFK,idMunicipioDivipolaFK) VALUES (?,?)";
				     
						try {	
							

							con=c.conectar();//abrir conexión
							
							ps=con.prepareStatement(sql1); //preparación
							
							//ps.setInt(1,cl.getIdUsuarioFK().getIdUsuario());
							ps.setInt(1,maxIdUsuario);
							ps.setInt(2,1);
										
							System.out.println(ps);
							ps.executeUpdate();//Ejecución sentencia
							ps.close();//cerrar sentencia
							System.out.println("Se registró una persona ");
										

						}catch(Exception e) {
							System.out.println("Error en la consulta del usuario "+e.getMessage());
						}
						finally {
							con.close();
						}
					
				} else if (ti == 2) {
					
					System.out.println("Tipo " + ti);
					String	sql1="INSERT INTO vendedor (idUsuarioFK) VALUES (?)";
					
					try {	
						

						con=c.conectar();//abrir conexión
						
						ps=con.prepareStatement(sql1); //preparación
						
						//ps.setInt(1,cl.getIdUsuarioFK().getIdUsuario());
						ps.setInt(1,maxIdUsuario);
									
						System.out.println(ps);
						ps.executeUpdate();//Ejecución sentencia
						ps.close();//cerrar sentencia
						System.out.println("Se registró una persona ");
									

					}catch(Exception e) {
						System.out.println("Error en la consulta del usuario "+e.getMessage());
					}
					finally {
						con.close();
					}
					
				} else if (ti == 1) {
					
					System.out.println("Tipo " + ti);
					String	sql1="INSERT INTO administrador (idUsuarioFK) VALUES (?)";
					
					try {	
						

						con=c.conectar();//abrir conexión
						
						ps=con.prepareStatement(sql1); //preparación
						
						//ps.setInt(1,cl.getIdUsuarioFK().getIdUsuario());
						ps.setInt(1,maxIdUsuario);
									
						System.out.println(ps);
						ps.executeUpdate();//Ejecución sentencia
						ps.close();//cerrar sentencia
						System.out.println("Se registró una persona ");
									

					}catch(Exception e) {
						System.out.println("Error en la consulta del usuario "+e.getMessage());
					}
					finally {
						con.close();
					}
				}
		
		
		return r;
	}
	
  public static String upperCaseFirst(String val) {
	  char[] arr = val.toCharArray();
				
		System.out.println("caracteres ascii "+val);
		
		for (int x =0; x < val.length(); x++) {
			


	        byte[] bytes = val.getBytes(StandardCharsets.US_ASCII);
	        
	        System.out.println("ASCII Numeric Value: "+bytes[x] + " pertenece a letra " + val.charAt(x));
	        
	    if (bytes[x] >= 97 && bytes[x] <= 122) {	    	
	    	
	        arr[x] = Character.toUpperCase(arr[x]);
	        System.out.println("Caracter que se paso a mayuscula es " + arr[x]);
	        
	        break;
	    }
	    
	}

      return new String(arr);
   }
	
	public String claves_aleatorias() {
		   String clave;
			
			System.out.println(UUID.randomUUID().toString());
			
			clave =UUID.randomUUID().toString().substring(0,20);
			
			clave = clave.replace("-", "!");
			
			clave=upperCaseFirst(clave);
			
			return clave;

	}
	
	//metodo para validar parametros de tipo int

	public boolean validarNumeros(String datos) {
		return datos.matches("[0-9]*");
	}

	public boolean validarTexto(String datos) {
		
		    int length = 0;
			int validaTextFalse = 0;             //variable captura el mensaje de error
			String error = null;
			
			System.out.println("caracteres ascii "+datos);
			
			for (int x =0; x < datos.length(); x++) {
				


		        byte[] bytes = datos.getBytes(StandardCharsets.US_ASCII);
		        System.out.println("ASCII Numeric Value: "+bytes[x] + " pertenece a letra " + datos.charAt(x));
		        
		    if ((bytes[x] == 32) || (bytes[x] == 63) || (bytes[x] >= 65 && bytes[x] <= 90) || (bytes[x]>= 97 && bytes[x] <= 122) || (bytes[x] >= 160 && bytes[x] <= 165)) {

		    	
		    	System.out.println("Caracter está dentro de los valores permitidos ");
		    	
		   	}else {
		   			
		   		validaTextFalse++;
		   		System.out.println("Caracter está fuera de los valores permitidos ");
		   		error="Caracter no permitido";
		   	}
	        
	        		
	     length = (x + 1); // Cuenta la longitud del nombre

	    }
			
		if (length <= 1 || length > 50) {                // Revisa la longitud minima o maxima del campo
			validaTextFalse=validaTextFalse+1;
				System.out.println("no cumple con el mínimo o maximo de caracteres permitidos en el campo!");
				error =error + " y el largo de caracteres permitidos en el campo";
			}
		
		if (validaTextFalse >= 1){
			
			System.out.println("Texto ingresado tiene " + validaTextFalse + " errores en " + error);
			
			return false;
		}else {
			
			System.out.println("Texto ingresado tiene " + validaTextFalse + " errores en " + error);
		
			return true;
		}
		
		
	  }
	   
	
	
}