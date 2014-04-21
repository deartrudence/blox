class Webpage < ActiveRecord::Base
	has_many :web_layouts
	has_many :blocs, through: :web_layouts



	def add_bloc
		self.bloc_id = self.bloc_id.push(:bloc_id)
		self.bloc_id_will_change!
		self.save
	end
end
