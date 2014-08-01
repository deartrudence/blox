require 'rails_helper'


describe Webpage do 
	it "has a valid factory" do
		FactoryGirl.create(:webpage).should be_valid
	end
	it "is invalid without a name" do
		FactoryGirl.build(:webpage, name: nil).should_not be_valid
	end
end