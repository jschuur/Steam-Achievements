class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    session[:new_user] = nil

    if current_user.update_attributes(params[:user])
      redirect_to root_path, :alert => 'Successfully saved Steam ID'
    else
      redirect_to root_path, :alert => 'Error saving Steam ID'
    end
  end

  def disconnect_twitter
    if current_user
      current_user.update_attributes({ :twitter_uid => nil,
                                       :twitter_real_name => nil,
                                       :twitter_handle => nil,
                                       :twitter_token => nil,
                                       :twitter_secret => nil })
    end

    redirect_to settings_path, :flash => { :success => "You've disconnected your Twitter account from this Steam account." }
  end
end
