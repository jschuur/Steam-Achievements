class AchievementsController < ApplicationController
  def show
    if STEAMGAMES[params[:game]]
      session[:last_steamid] = params[:user]

      id = SteamId.new(params[:user])
      stats = id.game_stats(params[:game])

      @total_achievements = stats.achievements.length
      @unlocked = stats.achievements.find_all { |a| a.unlocked? }.sort {|a,b| -1 * (a.timestamp.to_i <=> b.timestamp.to_i) }
      @history = sparkline_history(@unlocked)
    else
      redirect_to root_path, :alert => "<b>Error</b>: Unknown game ID '#{params[:game]}'"
    end
  end

  # 4 week history of the number of achievements unlocked
  def sparkline_history(unlocked)
    achievements_per_day = unlocked.map(&:timestamp).compact.reduce(Hash.new(0)) { |hash, timestamp| hash[timestamp.strftime("%D")] += 1; hash }
    (Date.today-28 .. Date.today).map { |d| achievements_per_day[d.strftime("%D")] }
  end  
end
