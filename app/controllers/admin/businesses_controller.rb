class Admin::BusinessesController < ApplicationController 
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  def index
    redirect_to admin_business_path(1)
  end

  def show
    @business = Business.find(1)
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(params[:business])
      redirect_to [:admin, @business], :notice  => "Successfully updated business."
    else
      render :action => 'edit'
    end
  end
end
