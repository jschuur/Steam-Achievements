class UsersController < ApplicationController
  def edit
    @user = current_user

    @user.steamid = session[:last_steamid] if session[:new_user]
  end
  
  def update
    session[:new_user] = nil

    if current_user.update_attributes(params[:user])
      redirect_to root_path, :alert => 'Successfully saved Steam ID'
    else
      redirect_to root_path, :alert => 'Error saving Steam ID'
    end
  end
end
