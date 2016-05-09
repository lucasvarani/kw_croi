class ServicesController < ApplicationController
  # before_filter :load_services  
  def index
    @services = Service.all(:conditions => ["active = true AND published = true"])
    render :layout => "interno"
  end

  def show
    @service = Service.find_by_id(params[:id])
    render :layout => "interno"
  end
end
