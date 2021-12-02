package model;

public class Categoria {
	
	private int idCategoria;
	private String nombreCategoria;
	private String descripcionCategoria;
	private Boolean estadoCategoria;
	public Categoria(int idCategoria, String nombreCategoria, String descripcionCategoria,Boolean estadoCategoria) {
		super();
		this.idCategoria = idCategoria;
		this.nombreCategoria = nombreCategoria;
		this.descripcionCategoria = descripcionCategoria;
		this.estadoCategoria = estadoCategoria;
	}
	public Categoria() {
		// TODO Auto-generated constructor stub
	}
	public int getIdCategoria() {
		return idCategoria;
	}
	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	public String getNombreCategoria() {
		return nombreCategoria;
	}
	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}
	public String getDescripcionCategoria() {
		return descripcionCategoria;
	}
	public void setDescripcionCategoria(String descripcionCategoria) {
		this.descripcionCategoria = descripcionCategoria;
	}
	public Boolean getEstadoCategoria() {
		return estadoCategoria;
	}
	public void setEstadoCategoria(Boolean estadoCategoria) {
		this.estadoCategoria = estadoCategoria;
	}
	
	
	

}
