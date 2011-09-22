class AdminController < ApplicationController
  before_filter :verify_admin
  respond_to :html, :js

  def index
    @users = User
    @redis = $redis.info
  end
  
  def action
    if params[:cmd] == "flushredis"
      @response = 'Success'
      @area = 'redis'
      $redis.flushall
    else
      @response = 'Unknown action'
    end

    respond_with do |format|
      format.js { }
    end
    
  end

  def verify_admin
    redirect_to root_path, :flash => { :error => "<strong>Hey!</strong> You're not an admin! Security!" } unless current_user && current_user.is_admin
  end
end
