class Admin::ArticlesController < ApplicationController
  access_control do
      allow :administrator, :all
  end 
  layout "admin"
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).all(:conditions => ["active = true"])
    else
      @articles = Article.all_active
    end
  end

  def show
    @article = Article.find(params[:id])     
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to [:admin, @article], :notice => "Successfully created article."
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to [:admin, @article], :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.newdestroy
    redirect_to admin_articles_url, :notice => "Successfully destroyed article."
  end
end
