class ChangeLatitudeTypeInStores < ActiveRecord::Migration
  def change
    change_column :stores, :latitude, :float
  end
end
