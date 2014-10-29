class UsersController < ApplicationController
	rescue_from Pundit::NotAuthorizedError, with: :deny_access

  include Pundit

	before_action :load_user, only: [:edit, :update, :show, :destroy]
  def index
  	@users = User.all
  #  @users = policy_scope(User)
  end

  def teachers
    @users = Teacher.all
    render :index
  end

  def venues
    @users = Venue.all
    render :index
  end

  def students
    @users = Student.all
    render :index
  end

  def new
  	@user = User.new
  end

  def show
  end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_url
		else
 			render :new
		end
    rescue ActiveRecord::RecordNotUnique 
    @user.errors.add(:email, "There is already a user with this email")
    render :new
	end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "user updated successfully"
      redirect_to users_path(@user)
    else
      flash[:error]  = "Ops! We couldn't update the user, please review the errors"
      render :edit
    end
#    save_categories
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  private
  def deny_access
    render text: "Your are not authorized to perform this action", status: :unauthorized
  end

  def user_params
    debugger
    if !params[:user].nil?
      @type_of_user = "user" 
  	  params.require(:user).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type, :city, :region, :country, :description, :website_url, :category_id, category_ids: []) 
         
    elsif !params[:teacher].nil?
      @type_of_user = "teacher"
      params.require(:teacher).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type, :city, :region, :country, :description, :website_url, :category_id, category_ids: [])
               
    elsif !params[:student].nil?
      @type_of_user = "student" 
      params.require(:student).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type, :city, :region, :country, :description, :website_url, :category_id, category_ids: []) 
         
    elsif !params[:venue].nil?
      
      @type_of_user = "venue" 
      params.require(:venue).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type, :city, :region, :country, :description, :website_url, :category_id, category_ids: []) 
       
    else 
      @type_of_user = "error"
      render text: "Incorrect type of user in params"
    end
  end

  def load_user
    @user = User.find(params[:id])
#   authorize @user
  end

  def save_categories
    if @type_of_user == "teacher"
    @user.categories.destroy
#    if !params[:categories].nil?
      params[:teacher][:categories].each do |cat|
        if cat != ""
        CatRelation.create(:user_id => @user.id, :category_id => cat)
        end
      end
    end
#    end
  end

end
