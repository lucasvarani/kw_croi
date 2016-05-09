class TeamsController < ApplicationController
  def index
 	@teams=Team.all(:conditions => ["active = true AND published = true"])
 	render :layout => "interno"
  end
end