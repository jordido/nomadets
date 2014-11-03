class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category", :foreign_key => "parent_id"
  has_many :courses
  has_and_belongs_to_many :users
  has_many :categories, through: :categories

  def parent_name
  	 if parent_category then parent_category.name else "" end
  end
  def <=> another
    if self.name < another.name
      -1
    elsif self.name < another.name
      1
    else
      0
    end
  end
end