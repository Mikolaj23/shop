class Admin::ProductsController < ApplicationController

  before_filter :authenticate_admin!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(params[:product])
    if @product == nil
      render new_admin_product_path
    else
      redirect_to admin_products_path
    end  

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path
    else
      render edit_admin_product_path
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
end
