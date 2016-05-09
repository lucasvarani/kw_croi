class Admin::HighlightsController < ApplicationController   
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  
  def index
    @highlights = Highlight.all_active
  end

  def show
    @highlight = Highlight.find(params[:id])
  end

  def new
    @highlight = Highlight.new
  end

  def create
    @highlight = Highlight.new(params[:highlight])
    if @highlight.save
      redirect_to [:admin, @highlight], :notice => "Successfully created highlight."
    else
      render :action => 'new'
    end
  end

  def edit
    @highlight = Highlight.find(params[:id])
  end

  def update
    @highlight = Highlight.find(params[:id])
    if @highlight.update_attributes(params[:highlight])
      redirect_to [:admin, @highlight], :notice  => "Successfully updated highlight."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @highlight = Highlight.find(params[:id])
    @highlight.newdestroy
    redirect_to admin_highlights_url, :notice => "Successfully destroyed highlight."
  end
  
end
