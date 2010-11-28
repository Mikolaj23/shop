class HomeController < ApplicationController
  def index
    @cart = Cart.find(session[:cart_id]) if session[:cart_id] != nil
    @products = Product.all    
    
  end
end
