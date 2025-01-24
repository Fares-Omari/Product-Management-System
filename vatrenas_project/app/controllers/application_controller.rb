;class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.role == "admin"
      products_path #redirect to the Admin page
    else
      main_home_path #redirect to the home page
    end
  end
end
