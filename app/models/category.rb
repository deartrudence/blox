class Category < ActiveRecord::Base
	has_many :blocs, :dependent => :destroy #when category deleted, blocs will be too

end
