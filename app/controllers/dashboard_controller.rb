class DashboardController < ApplicationController
  def index
  	@blocs = Bloc.all
  	@categories = Category.all
  	@webpages = Webpage.count
  end
end
