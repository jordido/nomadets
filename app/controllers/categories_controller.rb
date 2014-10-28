class CategoriesController < ApplicationController
 
  before_action :load_category, except: [:index, :new, :create]

  def index
  	@categories = Category.all
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def update
    @category = Category.find(params[:id])
  	if @category.update(category_params)
      # http://guides.rubyonrails.org/action_controller_overview.html#the-flash
      flash[:notice] = "category updated successfully"

      redirect_to category_path(@category)
    else
      flash[:error]  = "Ops! We couldn't update the category, please review the errors"
      render :edit
    end
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to categories_url
  	else
  		render :new
  	end
  end

  def show
  	@category = Category.find(params[:id])
 		@categories = @category.subcategories
	end

  def destroy
  	@category = Category.find(params[:id])
  	@category.destroy
  	redirect_to categories_url
  end

  private

  def category_params
  	params.require(:category).permit(:name, :icon, :parent_id)
  end

  def load_category
    @category = Category.find(params[:id])
  end
  
end
