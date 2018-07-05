class UsersController < ApplicationController
  def profile
    @user = User.find_by(username: params[:username])
  end
end
