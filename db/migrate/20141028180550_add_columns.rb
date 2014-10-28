class AddColumns < ActiveRecord::Migration
  def change
  	add_column :reviews, :author_id, :integer
  	add_column :reviews, :reviewed_id, :integer
  	add_column :reviews, :course_id, :integer
  end
end
