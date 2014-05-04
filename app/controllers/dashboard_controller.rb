class DashboardController < ApplicationController

	before_filter :admin

  def index
  	@blocs = Bloc.all
  	@categories = Category.all
  	@webpages = Webpage.count
  	@users = User.all
  end
end
