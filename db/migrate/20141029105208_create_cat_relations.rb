class CreateCatRelations < ActiveRecord::Migration
  def change
    create_table :cat_relations do |t|
      t.integer :cat_relation_category_id
      t.integer :cat_relation_user_id

      t.timestamps
    end
    add_index :cat_relations, :cat_relation_category_id
    add_index :cat_relations, :cat_relation_user_id
  end
end
