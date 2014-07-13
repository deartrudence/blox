class Bloc < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :bucket_blocs
  has_many :users, through: :bucket_blocs
  has_many :web_layouts
  has_many :webpages, through: :web_layouts
  has_many :likes, as: :likeable
  has_attached_file :bloc_img, :processors => [:cropper]
    validates_attachment_content_type :bloc_img, :content_type => /\Aimage\/.*\Z/
    acts_as_taggable # Alias for acts_as_taggable_on :tags

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_bloc_img, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  private

    def reprocess_bloc_img
      bloc_img.reprocess!
    end




  # def self.search(query)
  #   # where(:name, query) -> This would return an exact match of the query
  #   where("bloc.tag like ?", "%#{query}%") 
  # end

end
