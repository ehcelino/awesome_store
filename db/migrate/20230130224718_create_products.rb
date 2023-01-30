class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :keywords
      t.decimal :value
      t.integer :stock
      t.integer :sale, default: 0
      t.decimal :sale_price

      t.timestamps
    end
  end
end
