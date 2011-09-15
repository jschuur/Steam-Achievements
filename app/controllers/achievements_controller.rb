class AchievementsController < ApplicationController
  respond_to :html

  def index
  end

  def show
    if STEAMGAMES[params[:game]]
      respond_with do |format|
        format.html do
          if request.xhr?
            session[:last_steamid] = params[:user]
    
            achievements = Achievements.new(params[:user], params[:game])
            @unlocked = achievements.unlocked
            @history = achievements.sparkline_history
            @total_achievements = achievements.all.length
    
            results = render_to_string :partial => 'results'
            render :text => { :results => results, 
                              :achievements_path => achievements_path, :title => "#{STEAMGAMES[params[:game]]} achievements for #{params[:user]}",
                              :game => params[:game], :user => params[:user] }.to_json
          else
            render 'show'
          end
        end
      end
    else
      redirect_to root_path, :alert => "<b>Error</b>: Unknown game ID '#{params[:game]}'"
    end
  end
  
  def search
    redirect_to achievements_path(:user => params[:user], :game => params[:game])
  end
end
