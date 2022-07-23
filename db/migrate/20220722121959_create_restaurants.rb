class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.index :email, unique: true
      t.string :phone, null: false
      t.string :password_digest, null: false
      t.integer :location_no, null: false
      t.time :from_time, null: false
      t.time :to_time,null: false
      t.float :avg_menu_price, null: false
      t.integer :percent_donation, null: false
      t.string :website, null: false
      t.string :logo, null: false
      t.string :monday, null: false
      t.string :tuesday, null: false
      t.string :wednesday, null: false
      t.string :thursday, null: false
      t.string :friday, null: false
      t.string :saturday, null: false
      t.string :sunday, null: false
      t.string :tax, null: false
      t.string :leader_arrival, null: false
      t.string :alcohol_sales, null: false
      t.string :coupons, null: false

      t.timestamps
    end
  end
end
