class Profile < ActiveRecord::Base
  belongs_to :user

  def to_param
  	"#{id} #{handle}".parameterize
  end

  # validates :user, presence: true

  has_attached_file :avatar, :styles => { :thumb => "100x100!"}

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
