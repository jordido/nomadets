class AddShortDescriptionToUser < ActiveRecord::Migration
  def change
  	add_column :users, :short_description, :string, :limit => 80
  end
end
