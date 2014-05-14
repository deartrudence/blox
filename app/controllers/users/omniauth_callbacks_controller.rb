class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def twitter
		@user = User.from_twitter_auth request.env['omniauth.auth']
		#render json: request.env['omniauth.auth']
		sign_in_and_redirect @user
	end

	def facebook
		@user = User.from_facebook_auth request.env['omniauth.auth']
		sign_in_and_redirect @user
	end
end
