class RemoveColumnsFromSearches < ActiveRecord::Migration
  def change
  	remove_column :searches, :category1_id
    remove_column :searches, :category2_id
    remove_column :searches, :category3_id
    remove_column :searches, :category4_id
    remove_column :searches, :category5_id
    remove_column :searches, :category6_id
    remove_column :searches, :category7_id
    remove_column :searches, :category8_id
    remove_column :searches, :category9_id
    remove_column :searches, :category10_id
    add_column :searches, :user_type, :integer
  end
end
