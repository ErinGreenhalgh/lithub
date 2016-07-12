class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.nickname           = auth_info.nickname
      new_user.profile_pic        = auth_info.image
      new_user.bio                = auth_info.bio
      new_user.oauth_token        = auth_info.credentials.token
    end
  end
end
