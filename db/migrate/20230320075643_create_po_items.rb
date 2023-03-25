class CreatePoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :po_items do |t|
      t.string :bid, null: false, limit: 20
      t.integer :price, null: false, precision: 10, scale: 2
      t.references :purchase_order
      t.references :item
      
      t.timestamps
    end
  end
end
