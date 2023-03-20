class CreateProductOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :product_orders do |t|
      t.string :bid, null: false
      t.integer :quantity, null: false
      t.string :colour, null: false
      t.string :size, null: false

      t.timestamps
    end
  end
end
