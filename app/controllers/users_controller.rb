class UsersController < ApplicationController
  def profile
    @user = User.getProfile(username: params[:username])
  end
end
