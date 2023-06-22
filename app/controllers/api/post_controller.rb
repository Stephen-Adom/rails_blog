class Api::PostController < ActionController::API
  def index
    @posts = User.includes(:posts).find(params[:user_id]).posts
    render json: @posts, status: :ok
  end
end
