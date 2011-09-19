class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    if auth["provider"] == "steam"
      if user = User.find_by_steam_id64(auth["uid"])
        user.update_attribute(:login_account, true)
        session[:user_id] = user.id

        redirect_to root_url
      else
        user = User.create_with_omniauth(auth)
        session[:user_id] = user.id

        redirect_to settings_path, :flash => { :success => "You've successfully created a new, local account with your Steam account." }
      end
    elsif auth["provider"] == "twitter"
      if current_user
        current_user.update_attributes({ :twitter_uid => auth['uid'],
                                         :twitter_real_name => auth['user_info']['name'],
                                         :twitter_handle => auth['user_info']['nickname'],
                                         :twitter_token => auth['credentials']['token'],
                                         :twitter_secret => auth['credentials']['secret'] })
        redirect_to settings_path, :flash => { :success => "You've connected your Twitter account to your Steam account here."}
      else
        if user = User.find_by_twitter_uid(auth['uid'])
          session[:user_id] = user.id
          redirect_to root_url
        else
          render 'noaccount'
        end
      end
    else
      redirect_to root_url, :flash => { :error => "Unknown provider '#{auth["provider"]}'!" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def error
    redirect_to root_url, :alert => "Error: Unable to sign in (#{params[:message]})."
  end
end
