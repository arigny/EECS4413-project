class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email, null: false
      t.string :password, null: false
      t.boolean :admin, null: false, default: false
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
