class Webpage < ActiveRecord::Base
	has_many :web_layouts
	has_many :blocs, through: :web_layouts



	def add_bloc
	
	end
end
