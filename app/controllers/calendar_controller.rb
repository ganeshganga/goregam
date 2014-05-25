class CalendarController < ApplicationController
   before_filter :authenticate_user!, except: [:index, :show]
   # before_filter :get_user, :only => [:index,:new,:edit]
   # before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
   # load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
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
