class HomeController < ApplicationController
  def index
    # Action to handle the base URL (https://)
    @welcome_message = 'Welcome to Encarta Blog App!'
  end
end
