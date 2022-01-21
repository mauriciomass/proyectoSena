package model;

public class DetallePedido {
	

	private int idDetallePedido;
	private int cantidadDetallePedido;
	private int idPedidoFK;
	private int idProductoFK;
	private Double precioDetallePedido;
	public DetallePedido(int idDetallePedido, int cantidadDetallePedido,int idPedidoFK, int idProductoFK,Double precioDetallePedido) {
		super();
		this.idDetallePedido = idDetallePedido;
		this.cantidadDetallePedido = cantidadDetallePedido;
		this.idPedidoFK = idPedidoFK;
		this.idProductoFK = idProductoFK;
		this.precioDetallePedido = precioDetallePedido;
	}
	
	public DetallePedido() {
		// TODO Auto-generated constructor stub
	}
	
	public int getIdDetallePedido() {
		return idDetallePedido;
	}
	public void setIdDetallePedido(int idDetallePedido) {
		this.idDetallePedido = idDetallePedido;
	}
	public int getCantidadDetallePedido() {
		return cantidadDetallePedido;
	}
	public void setCantidadDetallePedido(int cantidadDetallePedido) {
		this.cantidadDetallePedido = cantidadDetallePedido;
	}
	public int getIdPedidoFK() {
		return idPedidoFK;
	}
	public void setIdPedidoFK(int idPedidoFK) {
		this.idPedidoFK = idPedidoFK;
	}
	public int getIdProductoFK() {
		return idProductoFK;
	}
	public void setIdProductoFK(int idProductoFK) {
		this.idProductoFK = idProductoFK;
	}

	public Double getPrecioDetallePedido() {
		return precioDetallePedido;
	}

	public void setPrecioDetallePedido(Double precioDetallePedido) {
		this.precioDetallePedido = precioDetallePedido;
	}

	public void setIdProductoFK(Pedido pedido, int i) {
		// TODO Auto-generated method stub
		
	}
	
	


}