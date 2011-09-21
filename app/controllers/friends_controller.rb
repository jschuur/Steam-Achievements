class FriendsController < ApplicationController
  respond_to :js

  def show
    @friends = Friends.new(params[:user])

    respond_with do |format|
      format.js { }
    end
  end
end