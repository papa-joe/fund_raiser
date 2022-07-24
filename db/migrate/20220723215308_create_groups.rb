class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_type
      t.string :description
      t.string :cheque_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
