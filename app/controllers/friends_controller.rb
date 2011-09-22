class FriendsController < ApplicationController
  respond_to :js

  def show
    @friends = SteamProfile.new(params[:user], :friends => true).friends

    respond_with do |format|
      format.js { }
    end
  end
end