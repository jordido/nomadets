class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_id"
  has_many :courses
  has_many :users
  has_many :categories, through: :categories
  has_many :catrelations
  has_many :users, through: :catrelations
end