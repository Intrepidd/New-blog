class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :log_user

  def log_user
    if session[:user_id]
      User.current = User.find(session[:user_id]) rescue nil
      if User.current.nil?
        session[:user_id] = nil
      end
    end
  end

  def render_404
    render :template => 'errors/404', :status => 404
  end
end

