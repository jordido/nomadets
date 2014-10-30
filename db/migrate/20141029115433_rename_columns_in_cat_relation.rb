class RenameColumnsInCatRelation < ActiveRecord::Migration
  def change
  	rename_column :cat_relations, :cat_relation_category_id, :category_id
  	rename_column :cat_relations, :cat_relation_user_id, :user_id
  end
end
