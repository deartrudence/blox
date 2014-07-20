FactoryGirl.define do 
	factory :profile do |f|
		f.user 
		f.handle "cleverhandle"
	end
end