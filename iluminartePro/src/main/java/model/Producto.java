package model;

import java.io.InputStream;


public class Producto {
	
	private int idProducto;
	private String nombreProducto;
	private Double precioProducto;
	private String descripcionProducto;
	private String imagenProducto;
	private Categoria idCategoriaFK;
	private Proveedor idProveedorFK;
	private Boolean estadoProducto;
	private int stockProducto;
	public Producto(int idProducto, String nombreProducto, Double precioProducto, String descripcionProducto,
			String imagenProducto, Categoria idCategoriaFK, Proveedor idProveedorFK,Boolean estadoProducto, int stockProducto) {
		super();
		this.idProducto = idProducto;
		this.nombreProducto = nombreProducto;
		this.precioProducto = precioProducto;
		this.descripcionProducto = descripcionProducto;
		this.imagenProducto = imagenProducto;
		this.idCategoriaFK = idCategoriaFK;
		this.idProveedorFK = idProveedorFK;
		this.estadoProducto = estadoProducto;
		this.stockProducto = stockProducto;
	}
	
	public Producto() {
		// TODO Auto-generated constructor stub
	}
	
	public String ImagenPhoto(String imagenProducto) {
		return this.imagenProducto = imagenProducto;
	}
	
	public int getIdProducto() {
		return idProducto;
	}
	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public Double getPrecioProducto() {
		return precioProducto;
	}
	public void setPrecioProducto(Double precioProducto) {
		this.precioProducto = precioProducto;
	}
	public String getDescripcionProducto() {
		return descripcionProducto;
	}
	public void setDescripcionProducto(String descripcionProducto) {
		this.descripcionProducto = descripcionProducto;
	}

	

	public String getImagenProducto() {
		return imagenProducto;
	}

	public void setImagenProducto(String imagenProducto) {
		this.imagenProducto = imagenProducto;
	}

	public Categoria getIdCategoriaFK() {
		return idCategoriaFK;
	}
	public void setIdCategoriaFK(Categoria idCategoriaFK) {
		this.idCategoriaFK = idCategoriaFK;
	}
	public Proveedor getIdProveedorFK() {
		return idProveedorFK;
	}
	public void setIdProveedorFK(Proveedor idProveedorFK) {
		this.idProveedorFK = idProveedorFK;
	}

	public Boolean isEstadoProducto() {
		return estadoProducto;
	}

	public void setEstadoProducto(Boolean estadoProducto) {
		this.estadoProducto = estadoProducto;
	}

	public int getStockProducto() {
		return stockProducto;
	}

	public void setStockProducto(int stockProducto) {
		this.stockProducto = stockProducto;
	}
	
	

}
