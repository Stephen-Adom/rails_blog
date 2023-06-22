class Api::UserController < ActionController::API
    def index
      render json: User.all
    end
  end