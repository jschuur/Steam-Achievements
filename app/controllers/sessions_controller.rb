class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    if user = User.find_by_steam_id64(auth["uid"])
      user.update_attribute(:login_account, true)
      session[:user_id] = user.id

      redirect_to root_url
    else 
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      session[:new_user] = true

      redirect_to settings_path
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
