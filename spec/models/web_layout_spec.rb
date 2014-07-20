require 'rails_helper'


describe WebLayout do 
	it "has a valid factory" do
		FactoryGirl.create(:web_layout).should be_valid
	end
	it "is invalid without a bloc" do
		FactoryGirl.build(:web_layout, bloc: nil).should_not be_valid
	end
	it "is invalid without a webpage" do
		FactoryGirl.build(:web_layout, webpage: nil).should_not be_valid
	end
	it "is invalid without a position" do
		FactoryGirl.build(:web_layout, position: nil).should_not be_valid
	end

end