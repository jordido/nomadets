class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :creator_id
      t.string :referred_id
      t.string :comment
      t.integer :rating
      t.string :course_id

      t.timestamps
    end
    add_index :reviews, :creator_id
    add_index :reviews, :referred_id
    add_index :reviews, :course_id
  end
end
