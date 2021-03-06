class LoginController < ApplicationController
  def index
    if request.get?
      redirect_to :controller => 'home' if is_loggned_in?
      render :layout => false
    elsif request.post?
      if params[:login]
        username = (params[:login][:username] || '').chomp
        password = (params[:login][:password] || '').chomp
        #find the user
        begin
          u = User.find(:first,:conditions => ["username = ?",username])
          err = ""
          if u.nil?
            err += "invalid user account"
          elsif u.password != password
            err += "invalid password"
          end
          if err.length > 0
            @error_message = "Invalid Username/Password combination: " + err || ""
            render :action => :index, :layout => false
          else
            session[:user] = u
            redirect_to :controller => "home", :action => "index"
          end
        end
      end
    end
    
  end

  def logout
    session[:user] = nil
    redirect_to :action => :index
  end
end
