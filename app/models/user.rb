class User < ActiveRecord::Base
  has_many :authentications
  devise :trackable, :omniauthable

  def set_params omniauth
    User.transaction do
      oauth_lock = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'], lock: true)
      if oauth_lock.nil?
        self.authentications.build self.get_args(omniauth)
      else
        oauth_lock.update_attributes self.get_args(omniauth)
      end
      self.save!
    end
  end

  def get_args omniauth
    data = omniauth['extra']['raw_info']
    case omniauth['provider']
    when 'twitter' then
      return {
        provider: omniauth['provider'], uid: omniauth['uid'],
        access_token: omniauth['credentials']['token'],
        access_secret: omniauth['credentials']['secret'],
        screen_name: data['screen_name'],
        bio: data['description'],
        image_url: data['profile_image_url'],
        web_url: data['url'],
        last_tid: nil
      }
    when 'github' then
      return {
        provider: omniauth['provider'], uid: omniauth['uid'],
        access_token: omniauth['credentials']['token'],
        access_secret: omniauth['credentials']['secret'],
        screen_name: data['login'],
      }
    when 'facebook' then
      return {
        provider: omniauth['provider'], uid: omniauth['uid'],
        access_token: omniauth['credentials']['token'],
        access_secret: omniauth['credentials']['secret'],
        screen_name: data['name'],
      }
    end
  end
end
