class AchievementsController < ApplicationController
  before_filter :formhint, :only => [:index, :show]
  respond_to :html, :js

  def index
  end

  def show
    if APP_CONFIG['games'][params[:game]]

      respond_with do |format|
        format.js do 
          @achievements = Achievements.new(params[:user], params[:game])
          @title = "#{APP_CONFIG['games'][params[:game]]} achievements for #{@achievements.id.nickname}"
        end
        format.html { render 'show' }
      end
    else
      redirect_to root_path, :alert => "<b>Error</b>: Unknown game ID '#{params[:game]}'"
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
