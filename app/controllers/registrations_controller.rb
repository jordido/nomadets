class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # userMailer.delay(run_at: 1.minute.from_now).welcome(@user)

      redirect_to users_path
    else
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:email, "There is already a user with this email")

    render :new
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :password_digest, :password_confirm, :email, :address, :type)
  end
end
