class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end

  def total_items
    sum = 0
    orderables.each do |orderable|
      sum += orderable.quantity
    end
    sum
  end

  def update_quantity
    orderables.each do |ord|
      product = Product.find_by(id: ord.product_id)
      new_quantity = product.stock - ord.quantity
      product.stock = new_quantity
      product.save
    end
  end

end
