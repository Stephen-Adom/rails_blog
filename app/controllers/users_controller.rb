class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
