class UsersController < ApplicationController
  def show
    # Action to handle https://users/745
    @user = User.find(params[:user_id])
  end
end
