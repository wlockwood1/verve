class AddGeocodedAddressToStores < ActiveRecord::Migration
  def change
    add_column :stores, :geocoded_address, :string
  end
end
