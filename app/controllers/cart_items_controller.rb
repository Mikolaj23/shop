class CartItemsController < ApplicationController

  def new
    if session[:cart_id] == nil
      @cart = Cart.create()
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
    end

    @cart_item = CartItem.new
    @product = Product.find(params[:product_id])
    
    redirect_to edit_cart_item_path(@cart.cart_items.select{|i| i.product.id == @product.id}.first) if @cart.products.include?(@product)
  end
  
  def create
    @cart = Cart.find(session[:cart_id])
    @cart_item = @cart.cart_items.create(params[:cart_item])
    redirect_to root_path
  end

  def edit
    @cart_item = CartItem.find(params[:id])
  end

  def update
    @cart = Cart.find(session[:cart_id])
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.update_attributes(params[:cart_item])
      redirect_to root_path
    else
      render edit_cart_item_path
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to root_path
  end 
end
