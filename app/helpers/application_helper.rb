module ApplicationHelper
  def current_route_is_root_path?
    request.path == root_path || request.path == users_path
  end

  def render_error_border(form, label)
    !form.object.errors.empty? && form.object.errors.key?(label) ? 'invalid' : ''
  end

  def render_error_message_for_input(form, label)
    "#{label} " << form.object.errors[label][0]
  end
end
