class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :reviews, :creator_id, :author_id
  	rename_column :reviews, :referred_id, :reviewed_id
  end
end
