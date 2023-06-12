class UsersController < ApplicationController
  def index
    @placeholder = 'List of users'
  end

  def show
    @placeholder = "User details for id: #{params[:id]}"
  end
end
