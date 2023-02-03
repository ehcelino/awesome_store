class Product < ApplicationRecord

  has_rich_text :description
  has_many_attached :images
  has_many :orderables
  has_many :carts, through: :orderables
  
end
