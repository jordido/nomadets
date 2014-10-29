class RenameCatRelations < ActiveRecord::Migration
  def change
  	rename_table :cat_relations, :categories_users
  	remove_column :categories_users, :id
  end
end
