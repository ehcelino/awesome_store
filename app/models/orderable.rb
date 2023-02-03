class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    product.value * quantity
  end
  
end
