class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def confirm_logged_in
    unless session[:current_user_emailadd]
        flash[:warning] = "Please log in first."
        redirect_to :root
        return false
    else
        return true
    end
  end
  
end
