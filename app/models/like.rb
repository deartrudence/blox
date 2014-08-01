class Like < ActiveRecord::Base
	# attr_accessible :user, :likeable

	validates :user, :likeable, { presence: true}

	belongs_to :likeable, :polymorphic => true, :counter_cache => true

	belongs_to :user

	validates_uniqueness_of :user_id, :scope => [:likeable_id, :likeable_type]



end
