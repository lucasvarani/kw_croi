class CustomersController < ApplicationController
  before_filter :load_services  
  def index
    @customers = Customer.all_published
  end
end
