class CreateShips < ActiveRecord::Migration[7.0]
  def change
    create_table :ships do |t|

      t.timestamps
    end
  end
end
