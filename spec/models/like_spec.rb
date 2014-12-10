require 'rails_helper'


describe Like do 
	it "has a valid factory" do
		FactoryGirl.create(:like).should be_valid
	end

	it "does not allow duplicate likes per user" do 
		user = FactoryGirl.create(:user)
		FactoryGirl.create(:like, likeable_id: 10, likeable_type: "Bloc", user: user) 
		FactoryGirl.build(:like, likeable_id: 10, likeable_type: "Bloc", user: user).should_not be_valid 
	end

end