class Bloc < ActiveRecord::Base
	belongs_to :category
	has_many :web_layouts
	has_many :webpages, through: :web_layouts
	has_attached_file :bloc_img
  	validates_attachment_content_type :bloc_img, :content_type => /\Aimage\/.*\Z/

end
