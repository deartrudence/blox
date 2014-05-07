class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:twitter]

   has_many :webpages

   def self.from_twitter_auth(auth)
    #if a user exists in the system with auth.uid and auth.provider, return it.
    #if a user doesn't exist in the system with auth.uid
    #and auth.provider, create a new one
    user = where(provider: auth.provider, uid: auth.uid).first_or_create(email: auth.info.name) 
    user.update(token: auth.credentials.token, secret: auth.credentials.secret)
    return user
  end


end
