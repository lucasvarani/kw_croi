class Admin::ProductImagesController < ApplicationController
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  
  before_filter :load_product  
  
  def index
    @product_images = @product.product_images.all_active
  end

  def show
    @product_image = @product.product_images.find(params[:id])
  end

  def new
    @product_image = @product.product_images.build
  end

  def create
    @product_image = @product.product_images.build(params[:product_image])
    if @product_image.save
      redirect_to admin_product_product_image_path(@product, @product_image), :notice => "Successfully created product image."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_image = @product.product_images.find(params[:id])
  end

  def update
    @product_image = @product.product_images.find(params[:id])
    if @product_image.update_attributes(params[:product_image])
      redirect_to admin_product_product_image_path(@product, @product_image), :notice  => "Successfully updated product image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_image = @product.product_images.find(params[:id])
    @product_image.newdestroy
    redirect_to admin_product_product_images_path(@product), :notice => "Successfully destroyed product image."
  end
  
  def load_product
    @product = Product.find(params[:product_id])
  end


end
