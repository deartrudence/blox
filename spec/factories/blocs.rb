
require 'faker'

	

FactoryGirl.define do 
# 	factory :category do |f|
# 		f.name "header-test"
# 	end
	# factory :user do |f|
	# 	f.email {Faker::Internet.email}
	# 	f.role "designer"
	# end
	factory :bloc do |f|
		f.name "bloc-test"
		f.code "<code>"
		f.category 
		f.user
	end
	
end