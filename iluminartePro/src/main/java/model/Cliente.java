package model;

public class Cliente {
	
	private int idCliente;	
	private Usuario idUsuarioFK;
	private Divipola idMunicipioFK;
	public Cliente(int idCliente, Usuario idUsuarioFK, Divipola idMunicipioFK) {
		super();
		this.idCliente = idCliente;
		this.idUsuarioFK = idUsuarioFK;
		this.idMunicipioFK = idMunicipioFK;
		
	}
	
	public Cliente() {
		// TODO Auto-generated constructor stub
	}
	
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public Usuario getIdUsuarioFK() {
		return idUsuarioFK;
	}
	public void setIdUsuarioFK(Usuario idUsuarioFK) {
		this.idUsuarioFK = idUsuarioFK;
	}
	public Divipola getIdMunicipioFK() {
		return idMunicipioFK;
	}
	public void setIdMunicipioFK(Divipola idMunicipioFK) {
		this.idMunicipioFK = idMunicipioFK;
	}

		
}
