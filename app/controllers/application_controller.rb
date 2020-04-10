class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_part_of_wedding?(user, wedding)
    unless user.in?(wedding.users) 
      flash[:error] = "You don't have access here"
      redirect_back(fallback_location: root_path) unless user.in?(wedding.users)
    end
  end

  def check_if_planner
    unless current_user.planner?
      flash[:error] = 'Access denied'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar, :phone_number])
  end
end
