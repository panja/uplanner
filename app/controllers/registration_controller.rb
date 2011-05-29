class RegistrationController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user] = @user
      redirect_to :controller => "home", :action => "index"
    else
      redirect_to :controller => "registration", :action => "index"
    end
  end

end
