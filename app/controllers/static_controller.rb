class StaticController < ApplicationController

	layout nil
	skip_before_filter :authenticate_user!

	def about_us
	end
	def terms
	end
	def contact
	end

end