FactoryGirl.define do 

	factory :user do |f|
		f.email {Faker::Internet.email}
		f.role "designer"
		f.password "123123"
		f.password_confirmation {"123123"}
	end

end