class ProductImage < ActiveRecord::Base
  attr_accessible :title, :order, :active, :published, :image_product, :product_id
  has_attached_file :image_product,
                    :styles => {
                      :medium => "422x422#",
                      :thumb => "93x93#"
                    }
  belongs_to :product
end
