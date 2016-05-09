class Admin::ProductInformationsController < ApplicationController
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  
  before_filter :load_product
  def index
    @product_informations = @product.product_informations.all_active
  end

  def show
    @product_information = @product.product_informations.find(params[:id])
  end

  def new
    @product_information = @product.product_informations.build
  end

  def create
    @product_information = @product.product_informations.build(params[:product_information])
    if @product_information.save
      redirect_to admin_product_product_informations_path(@product), :notice => "Successfully created product information."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_information = @product.product_informations.find(params[:id])
  end

  def update
    @product_information = @product.product_informations.find(params[:id])
    if @product_information.update_attributes(params[:product_information])
      redirect_to admin_product_product_informations_path(@product), :notice  => "Successfully updated product information."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_information = @product.product_informations.find(params[:id])
    @product_information.newdestroy
    redirect_to admin_product_product_informations_path(@product), :notice => "Successfully destroyed product information."
  end
  
  def load_product
    @product = Product.find(params[:product_id])
  end
end
