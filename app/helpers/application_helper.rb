module ApplicationHelper

	def gravatar_url(user)
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    	"http://gravatar.com/avatar/#{gravatar_id}.png"
  	end

  	def get_like_id(bloc,user)
  		Like.where(:likeable_id => bloc, :user_id => user)
  	end
  
end
