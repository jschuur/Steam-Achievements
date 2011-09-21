module SteamUtil
  def get_steam_id(user)
    if user.to_i.to_s == user
      SteamId.new(user.to_i)
    else
      SteamId.new(user)
    end
  end
end