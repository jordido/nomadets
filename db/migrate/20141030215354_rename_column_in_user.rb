class RenameColumnInUser < ActiveRecord::Migration
  def change
  	rename_column :users, :region, :state
  end
end
