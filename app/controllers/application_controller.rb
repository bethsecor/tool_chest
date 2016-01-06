class ApplicationController < ActionController::Base
  helper_method :most_recent_tool, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def most_recent_tool
    Tool.find(session[:most_recent_tool_id].to_i) if session[:most_recent_tool_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
