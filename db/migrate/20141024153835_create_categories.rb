class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string      :name
      t.string			:icon
      t.references  :parent
      t.timestamps
    end
  end
end