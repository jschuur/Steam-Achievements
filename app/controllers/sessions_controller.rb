class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    puts auth.to_yaml
    if user = User.find_by_uid(auth["uid"])
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
