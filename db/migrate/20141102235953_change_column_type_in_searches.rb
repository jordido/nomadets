class ChangeColumnTypeInSearches < ActiveRecord::Migration
  def change
  	remove_column :searches, :user_type
  	add_column :searches, :user_type, :string
  end
end
