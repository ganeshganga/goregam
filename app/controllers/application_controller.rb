class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
  
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end
  
end
