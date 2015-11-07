class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @photo = Photo.new
    @photos = Photo.where(user_id: @user).order('created_at DESC')
  end

end
