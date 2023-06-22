class Api::PostController < ActionController::API
  def index
    render json: User.includes(:posts).find(params[:user_id]).posts, status: :ok
  end
end
