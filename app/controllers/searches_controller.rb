class SearchesController < ApplicationController
  def new
    @countries  = Country.all
    @regions = []
    @cities = []
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      search_users
    else
      flash[:alert] = "Search unsuccessful"
      @countries  = Country.all
      @regions = Region.where(id: @search.region_id)
      @cities = (@search.city_id > 0) ? City.where(id: @search.city_id) : []
      render 'new'
    end
  end

  def search_users
    if !@search.category_ids[0]
      @users = User.all.to_a
    else
      @users = []
    end
    @search.category_ids.each  do |category|
      cat = Category.find(category)
      if cat
        @users_in_cat = cat.users
        @users = (@users + @users_in_cat).uniq
      end
    end
    
    @users.keep_if { |u| u.type == @search.user_type }
    
    city_search = (@search.city_id.nil?) ? 0 : @search.city_id
    region_search = (@search.region_id.nil?) ? 0 : @search.region_id
    country_search = (@search.country_id.nil?) ? 0 : @search.country_id
    
    if city_search > 0 
        @users.keep_if { |u| u.city_id == city_search }
    elsif region_search > 0    
          @users.keep_if { |u| u.region_id == region_search }
        elsif country_search > 0   
           @users.keep_if { |u| u.country_id == country_search }
    end
    render '/users/index'
  end

  #def map
  #  @users = @users.located.first
  #  @users.to_json
  #end

  def update_regions
    # updates regions and cities based on country selected
    country = Country.find(params[:country_id])
    # map to name and id for use in our options_for_select
    @regions = country.regions.map{|r| [r.name, r.id]}.insert(0, "Select a region")
  end

  def update_cities
    # updates cities based on region selected
    region = Region.find(params[:region_id])
    @cities = region.cities.map{|c| [c.name, c.id]}.insert(0, "Select a city")
    # respond_to do |format|
    #   format.html { redirect_to searches_url }
    #   format.js
    # end
  end

  private
  def search_params
    params.require(:search).permit(:user_type, :country_id, :region_id, :city_id, :search_string, :tags, category_ids:[])
  end
end