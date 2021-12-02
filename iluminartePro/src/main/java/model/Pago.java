package model;

public class Pago {

	private int idPago;
	private String estadoPago;
	private String tipoPago;
	private Double valorPago;
	private Double pocentajeIvaPago;
	private Pedido idPedidoFK; 
	public Pago(int idPago, String estadoPago, String tipoPago,Double valorPago, Double pocentajeIvaPago, Pedido idPedidoFK) {
		super();
		this.idPago = idPago;
		this.estadoPago = estadoPago;
		this.tipoPago = tipoPago;
		this.valorPago = valorPago;
		this.pocentajeIvaPago = pocentajeIvaPago;
		this.idPedidoFK = idPedidoFK;
	}
	public Pago() {
		// TODO Auto-generated constructor stub
	}
	public int getIdPago() {
		return idPago;
	}
	public Double getValorPago() {
		return valorPago;
	}
	public void setValorPago(Double valorPago) {
		this.valorPago = valorPago;
	}
	public void setIdPago(int idPago) {
		this.idPago = idPago;
	}
	public String getEstadoPago() {
		return estadoPago;
	}
	public void setEstadoPago(String estadoPago) {
		this.estadoPago = estadoPago;
	}
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
	}
	public Double getPocentajeIvaPago() {
		return pocentajeIvaPago;
	}
	public void setPocentajeIvaPago(Double pocentajeIvaPago) {
		this.pocentajeIvaPago = pocentajeIvaPago;
	}
	public Pedido getIdPedidoFK() {
		return idPedidoFK;
	}
	public void setIdPedidoFK(Pedido idPedidoFK) {
		this.idPedidoFK = idPedidoFK;
	}
	
	@Override
	public String toString() {
		return "Pago [idPago=" + idPago + ", estadoPago=" + estadoPago + ", tipoPago=" + tipoPago + ", pocentajeIvaPago=" + pocentajeIvaPago
				+ ", idPedidoFK=" + idPedidoFK + "]";
	}
	
}
