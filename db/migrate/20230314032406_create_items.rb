class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :bid, null: false, limit: 20
      t.string :name, null: false, limit: 60
      t.string :description, null: false, limit: 60
      t.string :category, null: false, limit: 60
      t.string :brand, null: false, limit: 60
      t.integer :quantity, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.string :colour, null: false, limit: 60
      t.string :size, null: false, limit: 60
      t.decimal :weight, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
