class CreatePurchaseOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_orders do |t|
      t.string :lname, null: false, limit: 20
      t.string :fname, null: false, limit: 20
      t.string :status, null: false, limit: 20
      t.references :address

      t.timestamps
    end
  end
end
