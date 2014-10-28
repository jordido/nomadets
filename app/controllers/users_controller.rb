class UsersController < ApplicationController
	rescue_from Pundit::NotAuthorizedError, with: :deny_access

  include Pundit

	before_action :load_user, except: [:index, :new, :create]
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  end

	def create
		## Creating new instance user with params from browser
		@user = User.new(user_params)

		## Check if user is saved to DB (it passes validations)
		if @user.save
			redirect_to users_url
		else
			## display the "new.html.erb" template with the @user variable
 			render :new
		end
    rescue ActiveRecord::RecordNotUnique 
    @user.errors.add(:email, "There is already a user with this email")
    render :new
	end

  def edit
  end

  def update
 #    debugger
    if @user.update(user_params)
      # http://guides.rubyonrails.org/action_controller_overview.html#the-flash
      flash[:notice] = "user updated successfully"

      redirect_to user_path(@user)
    else
      flash[:error]  = "Ops! We couldn't update the user, please review the errors"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  
  def deny_access
    render text: "Your are not authorized to perform this action", status: :unauthorized
  end

  def user_params
    if !params[:user].nil?
  	  params.require(:user).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type, :city, :region, :country, :description, :website_url)
     
    elsif !params[:teacher].nil?
      params.require(:teacher).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type)
   
    elsif !params[:student].nil?
      params.require(:student).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type)

    elsif !params[:venue].nil?
      params.require(:venue).permit(:name, :last_name, :password, :password_confirmation, :email, :address, :type)
   
    else 
      render text: "Incorrect type of user in params"
    end
  end

  def load_user
    @user = User.find(params[:id])
  end

end
