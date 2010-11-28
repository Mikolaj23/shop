class OrdersController < ApplicationController
  def new
    @cart = Cart.find(session[:cart_id]) if session[:cart_id] != nil
    @order = Order.new
    redirect_to root_path if @cart == nil
  end

  def create
    @cart = Cart.find(session[:cart_id]) if session[:cart_id] != nil
    if @cart == nil
      redirect_to root_path, :notice => 'Koszyk jest pusty!'
    else    
      @cart.make_order(params[:order])
      session[:cart_id] = nil
      redirect_to root_path, :notice => 'Zamówienie zostało złożone'
    end
  end
end
