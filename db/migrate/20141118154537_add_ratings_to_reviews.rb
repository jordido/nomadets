class AddRatingsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rating_1, :integer, :default => 0
    add_column :reviews, :rating_2, :integer, :default => 0
    add_column :reviews, :rating_3, :integer, :default => 0
    add_column :reviews, :rating_4, :integer, :default => 0
  end
end
