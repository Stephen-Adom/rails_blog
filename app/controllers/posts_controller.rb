class PostsController < ApplicationController
  def index
    @placeholder = "List of posts for user id: #{params[:user_id]}"
  end

  def show
    @placeholder = "List of post details for id: #{params[:id]} for user id: #{params[:user_id]}"
  end
end
