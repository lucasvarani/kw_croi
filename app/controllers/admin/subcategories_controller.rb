class Admin::SubcategoriesController < ApplicationController
  access_control do
    allow :administrator, :all
  end
  
  before_filter :load_category
  layout "admin"
  
  def index
    @subcategories = @category.children
  end

  def show
    @subcategory = @category.children.find(params[:id])
  end

  def new
    @subcategory = @category.children.build
  end

  def create
    @subcategory = @category.children.build(params[:category])
    @subcategory.father_id = @category.id
    if @subcategory.save
      redirect_to admin_category_subcategory_path(@category, @subcategory), :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @subcategory = @category.subcategories.find(params[:id])
  end

  def update
    @subcategory = @category.subcategories.find(params[:id])
    if @subcategory.update_attributes(params[:subcategory])
      redirect_to admin_category_subcategory_path(@category, @subcategory), :notice  => "Successfully updated subcategory."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @subcategory = @category.subcategories.find(params[:id])
    @subcategory.destroy
    redirect_to admin_category_subcategories_path(@category), :notice => "Successfully destroyed subcategory."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
  end
end
