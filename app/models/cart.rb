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

end
