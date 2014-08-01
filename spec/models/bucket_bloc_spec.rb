require 'rails_helper'



describe BucketBloc do 
	it "has a valid factory" do
		FactoryGirl.create(:bucket_bloc).should be_valid
	end
	it "is invalid without a user" do
		FactoryGirl.build(:bucket_bloc, user: nil).should_not be_valid
	end
	it "is invalid without a bloc" do
		FactoryGirl.build(:bucket_bloc, bloc: nil).should_not be_valid
	end
end