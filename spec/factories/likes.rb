require 'faker'
require 'Bloc'

	

FactoryGirl.define do 

	factory :like do |f|
		# f.likeable Bloc
		f.likeable_id 1
		f.likeable_type "Bloc" 
		f.user
	end
	
end