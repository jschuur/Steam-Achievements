class Friends
  attr_reader :error
  include SteamUtil

  def initialize(id)
    if id.privacy_state == 'public'
      @friends = load_friends(id)
    else
      @error = 'No public friend list available'
    end
  end

  def all
    @friends || []
  end

  private

  def load_friends(id)
    if cached_friends = $redis.get("friends_#{id.steam_id64}")
      Marshal.load(cached_friends)
    else
      friend_ids = id.friends.map(&:steam_id64)
      unless friend_ids.empty?
        begin
          WebApi.api_key = STEAM_WEB_API_KEY

          # Query for friends 100 at a time from the Steam API
          friends = []
          until friend_ids.empty? do
            batch_json = WebApi.json 'ISteamUser', 'GetPlayerSummaries', 2, { :steamids => friend_ids.shift(100).join(',') }
            friends += MultiJson.decode(batch_json)['response']['players']
          end

        rescue Exception => e
          @error = e.message
          return null
        else
          friends.each_with_index do |friend, i|
            if friend['profileurl'] && friend['profileurl'].index('/id/')
              friends[i]['custom_url'] = friend['profileurl'].split('/').last
            end
          end

          $redis.set("friends_#{id.steam_id64}", Marshal.dump(friends))
          $redis.expire("friends_#{id.steam_id64}", APP_CONFIG['friends_cache_time'] || 86400)

          friends
        end
      end
    end
  end
end