class Bloc < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :bucket_blocs
	has_many :users, through: :bucket_blocs
	has_many :web_layouts
	has_many :webpages, through: :web_layouts
	has_attached_file :bloc_img
  	validates_attachment_content_type :bloc_img, :content_type => /\Aimage\/.*\Z/

end
