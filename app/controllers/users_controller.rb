class UsersController < ApplicationController
    def show
      # Action to handle https://users/745
      # Implement logic to fetch user details
      @user = User.find(params[:user_id])
    end
  end
