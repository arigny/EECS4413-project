class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false, limit: 100
      t.string :province, null: false, limit: 20
      t.string :country, null: false, limit: 20
      t.string :zip, null: false, limit: 20
      t.string :phone, limit: 20

      t.timestamps
    end
  end
end
