class Admin::CustomersController < ApplicationController
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      redirect_to [:admin, @customer], :notice => "Successfully created customer."
    else
      render :action => 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      redirect_to [:admin, @customer], :notice  => "Successfully updated customer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.newdestroy
    redirect_to admin_customers_url, :notice => "Successfully destroyed customer."
  end
end
