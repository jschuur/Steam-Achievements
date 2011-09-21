class AchievementsController < ApplicationController
  before_filter :formhint, :only => [:index, :show]
  respond_to :html, :js

  def index
    render 'show'
  end

  def show
    respond_with do |format|
      format.js do 
        @achievements = Achievements.new(params[:user], params[:game])
        @title = "#{APP_CONFIG['games'].detect { |g| params[:game] == g['shortname'] }['fullname']} achievements for #{@achievements.id.nickname}"
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
