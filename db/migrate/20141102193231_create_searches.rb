class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :region_id
      t.integer :city_id
      t.string :tags
      t.string :search_string
      t.integer :category1_id
      t.integer :category2_id
      t.integer :category3_id
      t.integer :category4_id
      t.integer :category5_id
      t.integer :category6_id
      t.integer :category7_id
      t.integer :category8_id
      t.integer :category9_id
      t.integer :category10_id

      t.timestamps
    end
  end
end
