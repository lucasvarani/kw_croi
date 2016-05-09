class Service < ActiveRecord::Base
  attr_accessible :title, :active, :published, :image_service, :description
  has_attached_file :image_service, :styles  => {:icon => "30x30"} 
  
  def url_slug()
    "#{id}-#{title.parameterize}"
  end
end
