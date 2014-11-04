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
    @users = []
    @search.category_ids.each do |c|
      cat = Category.find(c)
      if cat
        @users_in_cat = cat.users
        @users = (@users + @users_in_cat).uniq
      end
    end
    
    # if (@search.user_type == "teachers") 
    #   @users = Teacher.all
    # elsif (@search.user_type == "venues")  
    #   @users = Venue.all
    # elsif (@search.user_type == "students") 
    #   @users = Student.all
    # else @users = User.all
    # end
    if !@search.city_id.nil?  
       @users.keep_if { |u| u.city_id == @search.city_id }    
    elsif @search.region_id > 0      
       @users.keep_if { |u| u.region_id == @search.region_id }
    elsif @search.country_id  > 0     
      @users.keep_if { |u| u.country_id == @search.country_id }
    end
  
    render 'users/index'
  end

  def map
    @users = @users.located
    @users.to_json
  end

  def update_regions
    # updates regions and cities based on country selected
    country = Country.find(params[:country_id])

    # map to name and id for use in our options_for_select
    @regions = country.regions.map{|r| [r.name, r.id]}.insert(0, "Select a region")
    p @regions
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.js
    end
  end

  def update_cities
    # updates cities based on region selected
    region = Region.find(params[:region_id])
    @cities = region.cities.map{|c| [c.name, c.id]}.insert(0, "Select a city")
    p @cities
    respond_to do |format|
      format.html { redirect_to searches_url }
      format.js
    end
  end

  private
  def search_params
    params.require(:search).permit(:user_type, :country_id, :region_id, :city_id, :search_string, :tags, category_ids:[])
  end

end