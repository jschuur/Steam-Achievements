class Friends
  attr_reader :error
  include SteamUtil

  def initialize(user)
    id = get_steam_id(user)

    if id.privacy_state == 'public'
      load_friends(id)
    else
      @error = 'No public friend list available'
    end
  end

  def all
    @friends || []
  end

  private

  def load_friends(id)
    friends = id.friends.map(&:steam_id64)
    unless friends.empty?
      begin
        WebApi.api_key = STEAM_WEB_API_KEY

        # Query for friends 100 at a time from the Steam API
        @friends = []
        until friends.empty? do
          batch_json = WebApi.json 'ISteamUser', 'GetPlayerSummaries', 2, { :steamids => friends.shift(100).join(',') }
          @friends += MultiJson.decode(batch_json)['response']['players']
        end

      rescue Exception => e
        @error = e.message
      else
        @friends.each_with_index do |friend, i|
          if friend['profileurl'] && friend['profileurl'].index('/id/')
            @friends[i]['custom_url'] = friend['profileurl'].split('/').last
          end
        end
      end
    end
  end
end