require 'rails_helper'


describe Bloc do 
	it "has a valid factory" do
		FactoryGirl.create(:bloc).should be_valid
	end
	it "is invalid without a name" do
		FactoryGirl.build(:bloc, name: nil).should_not be_valid
	end
	it "is invalid without a category" do
		FactoryGirl.build(:bloc, category: nil).should_not be_valid
	end
	it "is invalid without a user" do
		FactoryGirl.build(:bloc, user: nil).should_not be_valid
	end
	it "is invalid without code" do
		FactoryGirl.build(:bloc, code: nil).should_not be_valid
	end
end