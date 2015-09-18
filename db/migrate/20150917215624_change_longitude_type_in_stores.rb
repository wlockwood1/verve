class ChangeLongitudeTypeInStores < ActiveRecord::Migration
  def change
    change_column :stores, :longitude, :float
  end
end
