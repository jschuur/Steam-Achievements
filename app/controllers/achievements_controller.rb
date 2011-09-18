class AchievementsController < ApplicationController
  respond_to :html

  def index
  end

  def show
    if APP_CONFIG['games'][params[:game]]
      respond_with do |format|
        format.html do
          if request.xhr?
            session[:last_steamid] = params[:user]

            @achievements = Achievements.new(params[:user], params[:game])
            response = { :achievements_path => achievements_path,
                         :game => params[:game], :user => params[:user] }

            if @achievements.error
              response.merge! :error => "Error: #{@achievements.error}"
            else              
              response.merge!({ :results => render_to_string(:partial => 'results'),
                                 :title => "#{APP_CONFIG['games'][params[:game]]} achievements for #{@achievements.id.nickname}"})            
            end
            render :text => response.to_json
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
