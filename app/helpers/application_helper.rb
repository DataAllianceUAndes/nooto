module ApplicationHelper
  include Pagy::Frontend

  def is_active(path:)
    if request.path == path
      'active'
    else
      ''
    end
  end
end
