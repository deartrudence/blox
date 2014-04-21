class Bloc < ActiveRecord::Base
	belongs_to :category
	has_many :web_layouts
	has_many :webpages, through: :web_layouts
end
