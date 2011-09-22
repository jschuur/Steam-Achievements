class AchievementsController < ApplicationController
  before_filter :formhint, :only => [:index, :show]
  respond_to :html, :js

  def index
    render 'show'
  end

  def show
    respond_with do |format|
      format.js do 
        profile = SteamProfile.new(params[:user], :achievements => params[:game])
        @achievements = profile.achievements

        if current_user && (current_user.steam_id64.to_i != profile.id.steam_id64)
          @current_user_achievements = SteamProfile.new(current_user.steam_id64, :achievements => params[:game]).achievements.unlocked
          @compare_achievements = true
        end

        @title = "#{APP_CONFIG['games'].detect { |g| params[:game] == g['shortname'] }['fullname']} achievements for #{profile.id.nickname}"
      end
      format.html { render 'show' }
    end
  end

  def search
    redirect_to achievements_path(:user => params[:user], :game => params[:game])
  end

  protected

  def formhint
    if session[:hint] == 'display'
      session[:hint] = 'display'
    else
      session[:hint] = 'hide'
    end
  end
end
