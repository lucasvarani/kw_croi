class Admin::TeamsController < ApplicationController

  access_control do
      allow :administrator, :all
  end 
  layout "admin"

  def index
    @teams = Team.all(:conditions => ["active = true"])
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to [:admin, @team], :notice => "Successfully created team."
    else
      render :action => 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to [:admin, @team], :notice  => "Successfully updated team."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.newdestroy
    redirect_to admin_teams_url, :notice => "Successfully destroyed team."
  end
end
