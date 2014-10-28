class RemoveColumns < ActiveRecord::Migration
  def change
  	remove_column :reviews, :author_id
  	remove_column :reviews, :reviewed_id
  	remove_column :reviews, :course_id
  end
end
