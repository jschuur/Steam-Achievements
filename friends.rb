require 'steam-condenser'

id = SteamId.new('jschuur')

if friends = id.friends
  WebApi.api_key = '1CD200DDFFAC1FFFAB6C61A5CFE190CC'
  friends_json = WebApi.json 'ISteamUser', 'GetPlayerSummaries', 2, { :steamids => friends.map(&:steam_id64).join(',') }
  @friends = MultiJson.decode(friends_json)['response']['players']
end

@friends.each_with_index do |friend, i|
  if friend['profileurl'] && (friend['profileurl'].index('/id/'))
    @friends[i]['custom_url'] = friend['profileurl'].split('/').last
  end
end

puts @friends.map { |f| f['custom_url'] }.compact
