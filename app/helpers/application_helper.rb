module ApplicationHelper
  def current_route_is_root_path?
    request.path == root_path || request.path == users_path
  end
end
