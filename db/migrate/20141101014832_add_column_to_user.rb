class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :gmaps, :boolean
  end
end
