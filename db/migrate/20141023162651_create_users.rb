class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :region
      t.string :country
      t.string :description
      t.string :website_url
      t.string :password_digest

      t.timestamps
    end
  end
end
