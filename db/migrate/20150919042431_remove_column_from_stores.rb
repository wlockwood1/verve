class RemoveColumnFromStores < ActiveRecord::Migration
  def change
    remove_column :stores, :city, :string
    remove_column :stores, :state, :string
    remove_column :stores, :country, :string
  end
end
