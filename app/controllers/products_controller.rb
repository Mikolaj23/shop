class ProductsController < ApplicationController

  def index
    @cart = Cart.find(session[:cart_id]) if session[:cart_id] != nil
    @products = Product.all
  end

  def show
    @cart = Cart.find(session[:cart_id]) if session[:cart_id] != nil
    @product = Product.find(params[:id])
  end

end
