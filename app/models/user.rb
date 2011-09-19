class User < ActiveRecord::Base
  attr_accessible :steamid

  def self.create_with_omniauth(auth)
    player = auth["extra"]["user_hash"]["response"]["players"]["player"][0]

    create! do |user|
      user.steam_id64 = auth["uid"]
      user.steam_real_name = auth["user_info"]["name"]
      user.steam_nickname = auth["user_info"]["nickname"]

      # user.steam_privacy_state = ["private", "friendsonly", "public"][player["communityvisibilitystate"].to_i]

      user.steam_base_url = player["profileurl"]
      user.steam_custom_url = user.steam_base_url.split('/')[4] if user.steam_base_url.length > 0

      user.steam_full_avatar_url = player["avatarfull"]
      user.steam_medium_avatar_url = player["avatarmedium"]
      user.steam_icon_url = player["avatar"]
    end
  end
end
