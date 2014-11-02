class SearchController < ApplicationController
  def index
    @countries  = Country.all
    @regions = []
    @cities = []
    @search = []
  end

  def update_regions
    # updates regions and cities based on country selected
    country = Country.find(params[:country_id])

    # map to name and id for use in our options_for_select
    @regions = country.regions.map{|r| [r.name, r.id]}.insert(0, "Select a region")
    p @regions
    respond_to do |format|
      format.html { redirect_to search_url }
      format.js
    end
  end

  def update_cities
    # updates cities based on region selected
    region = Region.find(params[:region_id])
    @cities = region.cities.map{|c| [c.name, c.id]}.insert(0, "Select a city")
    p @cities
    respond_to do |format|
      format.html { redirect_to search_url }
      format.js
    end
  end

  private
  def search_params
    params.permit(:country_id, :region_id, :name)
  end

end

