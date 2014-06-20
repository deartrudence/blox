class MyDevise::RegistrationsController < Devise::RegistrationsController

	def create
		super #this calls Devise::RegistrationsController#create
		if resource.save
			p = Profile.new
			p.save
			resource.profile = p
			p.handle = resource.email
			p.save
			resource.save
		end
	end

end