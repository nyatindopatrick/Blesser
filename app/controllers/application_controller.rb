class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    render json: { error: "Unauthorized" } unless logged_in?
  end
end
