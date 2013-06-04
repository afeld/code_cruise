class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :must_be_admin

  def is_admin?
    request.host == 'localhost'
  end
  helper_method :is_admin?

  def must_be_admin
    unless is_admin?
      render file: "#{Rails.root}/public/403.html", status: :forbidden, layout: false
    end
  end
end
