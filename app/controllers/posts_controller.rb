class PostsController < ApplicationController
  def index
    @placeholder = "List of posts for user id: #{params[:id]}"
  end

  def show
    @placeholder = "List of post details for id: #{params[:post_id]} for user id: #{params[:id]}"
  end
end
