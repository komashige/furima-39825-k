class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.text :description,          null: false
      t.references :user,           null: false,foreign_key: true
      t.integer :ship_cost_id,      null: false
      t.integer :ship_area_id,      null: false
      t.integer :ship_day_id,       null: false
      t.integer :price,             null: false

      t.timestamps
    end
  end
end
