class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :subject
      t.string :user_id
      t.string :description
      t.string :calendar

      t.timestamps
    end
  end
end
