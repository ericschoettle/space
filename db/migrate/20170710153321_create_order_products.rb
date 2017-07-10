class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :order_id
    end
  end
end
