class MainController < ApplicationController
  def index
    # Give us nice permalinks without the search form querystring gunk
    redirect_to achievements_path(params[:user], params[:game]) if params[:user] && params[:game]
  end
end
