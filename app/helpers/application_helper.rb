module ApplicationHelper

	def gravatar_url(user)
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    	"http://gravatar.com/avatar/#{gravatar_id}.png"
  	end

  	def liked?(bloc,user)
  		Like.where(:likeable_id => bloc, :user_id => user).any?
  	end
  
end
