class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:twitter] #, :facebook


   has_many :webpages
   has_many :blocs
   has_many :bucket_blocs
   #has_many :blocs, through: :bucket_blocs
   has_one :profile
   has_many :likes

   #scope :created_blox, -> {where("user.blocs <> ''")}

  def created_blox?
    self.blocs.present?
  end
   

  def self.from_twitter_auth(auth)
    #if a user exists in the system with auth.uid and auth.provider, return it.
    #if a user doesn't exist in the system with auth.uid
    #and auth.provider, create a new one
    user = where(provider: auth.provider, uid: auth.uid).first_or_create(email: auth.info.name, avatar_url: auth.info.image) 
    user.update(token: auth.credentials.token, secret: auth.credentials.secret)
    return user
  end

  def self.from_facebook_auth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create(email: auth.info.name, avatar_url: auth.info.image)
    user.update(token: auth.credentials.token, secret: auth.credentials.secret)
    return user
  end

  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("email like ?", "%#{query}%") 
  end

end
