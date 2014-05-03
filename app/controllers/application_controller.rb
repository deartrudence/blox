class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

def admin
	if current_user.present?
		unless current_user.role == "admin"
		redirect_to webpages_path
		end
	end 
end