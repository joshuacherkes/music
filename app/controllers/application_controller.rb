class ApplicationController < ActionController::Base
  protect_from_forgery


  def signed_in?
    @user = User.find_by_token(session[:token])
    unless @user && !session[:token].nil?
      redirect_to new_session_url
    end
  end

  def is_admin?
    @user = User.find_by_token(session[:token])
    unless @user.admin
      render :text => "FORBIDDEN!!!!!!!!!"
    end
  end

end
