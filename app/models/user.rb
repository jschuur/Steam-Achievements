class User < ActiveRecord::Base
  def self.create_with_id(id)
    find_or_create_by_steam_id64(id.steam_id64) do |user|
      user.steam_id64 = id.steam_id64
      user.steam_real_name = id.real_name
      user.steam_privacy_state = id.privacy_state
      user.steam_nickname = id.nickname
      user.steam_custom_url = id.custom_url
      user.steam_base_url = id.base_url
      user.steam_full_avatar_url = id.full_avatar_url
      user.steam_medium_avatar_url = id.medium_avatar_url
      user.steam_icon_url = id.icon_url
    end
  end

  def self.create_with_omniauth(auth)
    player = auth["extra"]["user_hash"]["response"]["players"]["player"][0]

    create! do |user|
      user.login_account = true

      user.steam_id64 = auth["uid"]
      user.steam_real_name = auth["user_info"]["name"]
      user.steam_nickname = auth["user_info"]["nickname"]

      user.steam_privacy_state = ["private", "friendsonly", "public"][player["communityvisibilitystate"].to_i - 1]

      user.steam_base_url = player["profileurl"]
      user.steam_custom_url = user.steam_base_url.split('/')[4] if user.steam_base_url.length > 0

      user.steam_full_avatar_url = player["avatarfull"]
      user.steam_medium_avatar_url = player["avatarmedium"]
      user.steam_icon_url = player["avatar"]
    end
  end
end
