class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  before_filter :check_session
  
  def is_loggned_in?
    return !session[:user].blank?
  end

  def current_user
    return false unless is_loggned_in?
    User.find_by_id(session[:user][:id])
  end

  def check_session
    @session = session[:user]

    if !@session && @skip_session.nil?
      if controller_name != "login" && controller_name != "registration"
        redirect_to :controller => "login", :action => "index"
      end
    end
  end
end
