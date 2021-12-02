package model;

public class Proveedor {
	
	private int idProveedor;
	private String nombreProveedor;
	private String direccionProveedor;
	private String telefonoProveedor;
	private String personaContactoProveedor;
	private boolean estadoProveedor;
	
	public Proveedor(int idProveedor, String nombreProveedor, String direccionProveedor, String telefonoProveedor,
			String personaContactoProveedor,Boolean estadoProveedor) {
		super();
		this.idProveedor = idProveedor;
		this.nombreProveedor = nombreProveedor;
		this.direccionProveedor = direccionProveedor;
		this.telefonoProveedor = telefonoProveedor;
		this.personaContactoProveedor = personaContactoProveedor;
		this.estadoProveedor = estadoProveedor;
	}
	public Proveedor() {
		// TODO Auto-generated constructor stub
	}
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	public boolean getEstadoProveedor() {
		return estadoProveedor;
	}
	public void setEstadoProveedor(boolean estadoProveedor) {
		this.estadoProveedor = estadoProveedor;
	}
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	public String getDireccionProveedor() {
		return direccionProveedor;
	}
	public void setDireccionProveedor(String direccionProveedor) {
		this.direccionProveedor = direccionProveedor;
	}
	public String getTelefonoProveedor() {
		return telefonoProveedor;
	}
	public void setTelefonoProveedor(String telefonoProveedor) {
		this.telefonoProveedor = telefonoProveedor;
	}
	public String getPersonaContactoProveedor() {
		return personaContactoProveedor;
	}
	public void setPersonaContactoProveedor(String personaContactoProveedor) {
		this.personaContactoProveedor = personaContactoProveedor;
	}
	
	
	

}
