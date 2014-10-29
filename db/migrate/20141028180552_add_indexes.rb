class AddIndexes < ActiveRecord::Migration
  add_index :reviews, :author_id
  add_index :reviews, :reviewed_id
  add_index :reviews, :course_id
end
