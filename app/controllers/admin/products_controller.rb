class Admin::ProductsController < ApplicationController
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  def index
    @products = Product.all_active
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to [:admin, @product], :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to [:admin, @product], :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.newdestroy
    redirect_to admin_products_url, :notice => "Successfully destroyed product."
  end
end
