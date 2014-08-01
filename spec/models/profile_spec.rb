require 'rails_helper'


describe Profile do 
	it "has a valid factory" do
		FactoryGirl.create(:profile).should be_valid
	end
	it "is invalid without a user" do
		FactoryGirl.build(:profile, user: nil).should_not be_valid
	end
end