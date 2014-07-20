class MyDevise::RegistrationsController < Devise::RegistrationsController

	def create
		bloc = Bloc.all
		bucket_blocs = BucketBloc.all
		super #this calls Devise::RegistrationsController#create
		
		if resource.save
			p = Profile.new
			p.save
			resource.profile = p
			resource.save
			p.handle = resource.email.split("@").first
			p.save
			
			bloc.each do |bloc|
				if bloc.user.email == 'buildweblox@gmail.com'
					bucket_bloc = BucketBloc.new
					bucket_bloc.bloc = bloc
					bucket_bloc.user = resource
					bucket_bloc.save
				end
			end
		end
	end

end