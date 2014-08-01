class Webpage < ActiveRecord::Base
	has_many :web_layouts, ->{ order(:position) }
	has_many :blocs, through: :web_layouts
	belongs_to :user

	validates :name, presence: true
end