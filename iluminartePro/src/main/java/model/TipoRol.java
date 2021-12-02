package model;

public class TipoRol {
	
	private int idRol;	
	private String nombreRol;
	private boolean estadoRol;
public TipoRol() {
		
	}
	public TipoRol(int idRol, String nombreRol,boolean estadoRol) {
		super();
		this.idRol = idRol;
		this.nombreRol = nombreRol;
		this.estadoRol = estadoRol;
	}
	
	public boolean getEstadoRol() {
		return estadoRol;
	}
	public void setEstadoRol(boolean estadoRol) {
		this.estadoRol = estadoRol;
	}
	public int getIdRol() {
		return idRol;
	}
	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}
	public String getNombreRol() {
		return nombreRol; 
	}
	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}
	 
	

}
