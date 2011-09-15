class Achievements
  attr_reader :unlocked, :sparkline_history
  
  def initialize(user, game)
    @achievements = load_game_achievements(user, game)
    @unlocked = @achievements.find_all { |a| a.unlocked? }.sort {|a,b| -1 * (a.timestamp.to_i <=> b.timestamp.to_i) }

    # 4 week history of the number of achievements unlocked
    achievements_per_day = @unlocked.map(&:timestamp).compact.reduce(Hash.new(0)) { |hash, timestamp| hash[timestamp.strftime("%D")] += 1; hash }
    @sparkline_history = (Date.today-28 .. Date.today).map { |d| achievements_per_day[d.strftime("%D")] }
  end
  
  def all
    @achievements
  end

  private  

  def load_game_achievements(user, game)
    if cached_achievements = $redis.get("achievements_#{user}_#{game}")
      Marshal.load(cached_achievements)
    else
      id = SteamId.new(user)
      stats = id.game_stats(game)
      
      $redis.set("achievements_#{user}_#{game}", Marshal.dump(stats.achievements))
      $redis.expire("achievements_#{user}_#{game}", APP_CONFIG['achievement_cache_time'])
      
      stats.achievements
    end
  end
end