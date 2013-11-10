class User < ActiveRecord::Base

  has_many :tasks

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    # if username doesn't exist, create_from_omniauth
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      # for other providers besides twitter, we need to verify what the omniauth.auth hash is passing as the key value. It may de different from ["info"]["nickname"], and etc. 
    end
  end

end
