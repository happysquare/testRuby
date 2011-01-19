class ApplicationController < ActionController::Base
  protect_from_forgery
  #returns the current user or nil if there isn't one
  protected
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
      
    end
    
    #make current user available in templates as a helper
    helper_method :current_user
    
    #filter method to enforce login requirement
    def authentication
      logged_in? ? true : access_denied
    end
    
    #predicate to test for a logged user
    def logged_in?
      current_user.is_a? User
    end
    
    #make logged_in? a helper method available to the templates
    helper_method :logged_in?
    
    def access_denied 
      redirect_to login_path, :notice => "Please log in to continue" and return false 
    end
    
    #Email friend script
    def notify_friend
      
    end
end
