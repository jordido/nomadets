class ChangeKeyInCountry < ActiveRecord::Migration
  def change
  	rename_column :countries, :CountryId, :id
  	rename_column :regions, :RegionId, :id
  	rename_column :cities, :CityId, :id
  end
end
