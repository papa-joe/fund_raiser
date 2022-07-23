class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :state
      t.string :phone
      t.belongs_to :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
