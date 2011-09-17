class Achievements
  def initialize(user, game)
    if @achievements = load_game_achievements(user, game)
      @unlocked = @achievements.find_all { |a| a.unlocked? }.sort {|a,b| -1 * (a.timestamp.to_i <=> b.timestamp.to_i) }

      # 4 week history of the number of achievements unlocked
      achievements_per_day = @unlocked.map(&:timestamp).compact.reduce(Hash.new(0)) { |hash, timestamp| hash[timestamp.strftime("%D")] += 1; hash }
      @sparkline_history = (Date.today-28 .. Date.today).map { |d| achievements_per_day[d.strftime("%D")] }
    end
  end

  def invalid_user?
    @invalid_user
  end

  def invalid_game?
    @invalid_game
  end

  def all
    @achievements || []
  end

  def unlocked
    @unlocked || []
  end

  def sparkline_history
    @sparkline_history || []
  end

  private  

  def load_game_achievements(user, game)
    if cached_achievements = $redis.get("achievements_#{user}_#{game}")
      Marshal.load(cached_achievements)
    else
      begin 
        id = SteamId.new(user)
        begin
          stats = id.game_stats(game)

          $redis.set("achievements_#{user}_#{game}", Marshal.dump(stats.achievements))
          $redis.expire("achievements_#{user}_#{game}", APP_CONFIG['achievement_cache_time'])
      
          return stats.achievements
        rescue SteamCondenserError
          @invalid_game = true
        end
      rescue SteamCondenserError
        @invalid_user = true
      end
      
      return false
    end
  end
end