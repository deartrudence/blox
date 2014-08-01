require 'faker'

	

FactoryGirl.define do 

	factory :web_layout do |f|
		f.bloc
		f.webpage
		f.position '3'
	end
	
end