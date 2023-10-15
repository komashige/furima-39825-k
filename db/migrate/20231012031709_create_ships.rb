class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|
      t.string :building_name     
      t.string :post_code,          null: false
      t.integer :ship_area_id,      null: false
      t.string :city,               null: false
      t.string :street_address,     null: false  
      t.string :telephone_number,   null: false
      t.references :buy,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
