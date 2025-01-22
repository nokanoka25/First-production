class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # private
  # def not_authenticated
  # redirect_to login_path, alert: "Please login first"
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
