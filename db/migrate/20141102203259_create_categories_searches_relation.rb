class CreateCategoriesSearchesRelation < ActiveRecord::Migration
  def change
    create_table :categories_searches do |t|
    	t.integer :category_id
      t.integer :search_id
    end
  end
end
