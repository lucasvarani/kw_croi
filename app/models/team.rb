class Team < ActiveRecord::Base
  attr_accessible :title, :subtitle, :description, :published, :active
  # has_attached_file :image_team,
  #     :styles => {
  #       :thumb=> "50x50#",
  #       :small  => "150x150>" }
      
  
end
