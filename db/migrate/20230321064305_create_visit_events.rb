class CreateVisitEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_events do |t|
      t.string :ipaddress, null: false, limit: 20
      t.string :day, null: false, limit: 8
      t.string :bid, null: false, limit: 20
      t.string :eventtype, null: false, limit: 20
      t.references :item

      t.timestamps
    end
  end
end
