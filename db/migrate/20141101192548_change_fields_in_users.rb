class ChangeFieldsInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :country
  	remove_column :users, :state
  	rename_column :users, :city, :town
  	add_column :users, :country_id, :integer
  	add_column :users, :region_id, :integer
  	add_column :users, :city_id, :integer
  	add_index :users, :country_id
  	add_index :users, :region_id
  	add_index :users, :city_id
  end
end
