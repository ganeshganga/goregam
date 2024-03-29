class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
	  @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

	  if @user.persisted?
	    sign_in_and_redirect @user, :event => :authentication
	    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	  else
	    session["devise.facebook_data"] = request.env["omniauth.auth"]
	    redirect_to new_user_registration_url
	  end
	end

	# def twitter
	#   @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

	#   if @user.persisted?
	#     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	#     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	#   else
	#     session["devise.facebook_data"] = request.env["omniauth.auth"]
	#     redirect_to new_user_registration_url
	#   end
	# end

	def google_oauth2
	    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

	    if @user.persisted?
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	      sign_in_and_redirect @user, :event => :authentication
	    else
	      session["devise.google_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
	end

	def all
	  user = User.from_omniauth(request.env["omniauth.auth"])
	  if user.persisted?
	    flash.notice = "Signed in!"
	    sign_in_and_redirect user
	  else
	    session["devise.user_attributes"] = user.attributes
	    redirect_to new_user_registration_url
	  end
	end
	alias_method :twitter,:all
	# alias_method :facebook,:all
	# alias_method :google_oauth2,:all
end
