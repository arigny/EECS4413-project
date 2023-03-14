class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :bid
      t.string :name
      t.string :description
      t.string :category
      t.string :brand
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.string :colour
      t.string :size
      t.decimal :weight, precision: 10, scale: 2

      t.timestamps
    end
  end
end
