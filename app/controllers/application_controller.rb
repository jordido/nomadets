class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  ### Comentado para probar lo de los mapas
  protect_from_forgery with: :exception

  helper_method :current_user, :admin

  def current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user ||= User.find(current_user_id)
    end
  end


  def admin
    @current_user.email == "jordi@jordi.com" if @current_user
  end

end
