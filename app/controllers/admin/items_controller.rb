class Admin::ItemsController < ApplicationController  
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  
  before_filter :load_category 
  def index
    @items = @category.items.all_active
  end

  def show
    @item = @category.items.find(params[:id])
  end

  def new
    @item = @category.items.build
  end

  def create
    @item = @category.items.build(params[:item])
    if @item.save
      redirect_to admin_category_item_path(@category, @item), :notice => "Successfully created item."
    else
      render :action => 'new'
    end
  end

  def edit
    @item = @category.items.find(params[:id])
  end

  def update
    @item = @category.items.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to admin_category_item_path(@category, @item), :notice  => "Successfully updated item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item = @category.items.find(params[:id])
    @item.newdestroy
    redirect_to admin_category_items_path(@category), :notice => "Successfully destroyed item."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
  end
  
end
