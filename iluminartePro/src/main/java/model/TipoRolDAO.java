package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TipoRolDAO {
		/*Se requieren atributos para realizar las operaciones*/
			
			Connection con; //objeto de conexi�n
			PreparedStatement ps; //objeto para sentencias preparadas
			ResultSet rs; //objeto para almacenar consultas
			String sql=null; //variable para guardar sentencias
			
			Conexion c=new Conexion();
			
			int r;

			
			public List listarRoles() throws Exception{
				
				List<TipoRol> roles=new ArrayList<>();
				sql="SELECT * FROM tiporol";
				
				try {
					con=c.conectar(); //abrir conexion
					ps=con.prepareStatement(sql); //preparando la sentencia
					//ejecutamos la consulta y guardamos en el objeto rs
					rs=ps.executeQuery();
					//procesamos el resultado de la consulta
					while(rs.next()) {
						TipoRol r=new TipoRol();
						//Escribir en el setter de cada objeto
						r.setIdRol(rs.getInt("idRol"));
						r.setNombreRol(rs.getString("nombreRol"));
						r.setEstadoRol(rs.getBoolean("estadoRol"));
						
						roles.add(r);
					}
					ps.close(); //cerrar sentencia
					System.out.println("consulta exitosa");
				}catch(Exception e) {
					System.out.println("No existen roles definidos"+e.getMessage());
				}finally {
					con.close(); //cerrar conexi�n
				}
				return roles;
			}
			
			public int registrarRol(TipoRol tiporol) throws SQLException {
				sql="INSERT INTO tiporol (nombreRol,estadoRol) VALUES (?,?)";
				try {
					con=c.conectar();//abrir conexi�n
					ps=con.prepareStatement(sql); //preparaci�n
					ps.setString(1, tiporol.getNombreRol());
					ps.setBoolean(2, tiporol.getEstadoRol());
					System.out.println(sql);
					ps.executeUpdate();//Ejecucuci�n sentencia
					ps.close();//cerrar sentencia
					System.out.println("Se registro un rol");
					
				}catch(Exception e) {
					System.out.println("Error en el registro del rol "+e.getMessage());
				}
				finally {
					con.close();
				}
				return r;
			}
			
			public void eliminarRol(int idRol) throws SQLException {
				sql="DELETE FROM tiporol WHERE idRol="+idRol;
				System.out.println(sql);
				try {
					con=c.conectar();
					ps=con.prepareStatement(sql);
					ps.executeUpdate();
					ps.close();
					System.out.println("Se eliminó el rol");
				}catch(Exception e) {
					System.out.println("Error en la eliminación del registro "+e.getMessage());
				}
				finally {
					con.close();
				}
			}
			
			public TipoRol consultaporId(int idRol) throws SQLException {
				TipoRol ro=new TipoRol();
				sql="SELECT * from tiporol WHERE idRol="+idRol;
				try {
					con=c.conectar();
					ps=con.prepareStatement(sql);
					rs=ps.executeQuery();
					
					while(rs.next()) {
						ro.setIdRol(rs.getInt("idRol"));
						ro.setNombreRol(rs.getString("nombreRol"));
						ro.setEstadoRol(rs.getBoolean("estadoRol"));
						System.out.println("Se encontr� el rol");
						
					}
				}catch(Exception e) {
					System.out.println("Error en la consulta del rol "+e.getMessage());
				}
				finally {
					con.close();
				}
				
				return ro;
			}
			
			public int actualizarRol(TipoRol tiporol) throws SQLException {
				sql="UPDATE tiporol SET nombreRol=?,estadoRol=? "+
						"WHERE idRol="+tiporol.getIdRol();
				try {
					
					con=c.conectar();//abrir conexi�n
					ps=con.prepareStatement(sql); //preparaci�n
					ps.setString(1, tiporol.getNombreRol());
					ps.setBoolean(2, tiporol.getEstadoRol());
					
					System.out.println(sql);
					ps.executeUpdate();//Ejecucuci�n sentencia
					ps.close();//cerrar sentencia
					System.out.println("Se actualizo un rol");
				}catch(Exception e) {
					System.out.println("Error en la actualizacion del rol "+e.getMessage());
				}
				finally {
					con.close();
				}
				return r;
			}
			
			public int cambiarEstado(TipoRol tiporol) throws SQLException {
				sql="UPDATE tiporol SET estadoRol=? "+
						"WHERE idRol="+tiporol.getIdRol();
				try {
					
					con=c.conectar();//abrir conexi�n
					ps=con.prepareStatement(sql); //preparaci�n
					ps.setBoolean(1, tiporol.getEstadoRol());
					
					System.out.println(sql);
					ps.executeUpdate();//Ejecucuci�n sentencia
					ps.close();//cerrar sentencia
					System.out.println("Se actualiz� el estado del rol");
				}catch(Exception e) {
					System.out.println("Error en la actualizaci�n del estado rol "+e.getMessage());
				}
				finally {
					con.close();
				}
				return r;
			}			
		}