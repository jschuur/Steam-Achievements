class SteamProfile
  include SteamUtil
  attr_reader :error, :id

  def initialize(user, options = {})
    if @id = load_id(user)
      @friends = Friends.new(@id) if options[:friends]
      @achievements = Achievements.new(@id, options[:achievements]) if options[:achievements]
    end
  end

  def friends
    @friends || []
  end

  def achievements
    @achievements || []
  end

  private

  def load_id(user)
    if cached_id = $redis.get("user_#{user}")
      Marshal.load(cached_id)
    else
      begin
        id = get_steam_id(user)
      rescue Exception => e
        @error = e.message
        return null
      else
        $redis.set("user_#{user}", Marshal.dump(id))
        $redis.expire("user_#{user}", APP_CONFIG['user_cache_time'] || 604800)

        id
      end
    end
  end
end