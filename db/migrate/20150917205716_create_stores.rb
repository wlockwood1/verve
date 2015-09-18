class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
