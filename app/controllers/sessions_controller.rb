class SessionsController < ApplicationController


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_email_and_password(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      @token = SecureRandom.urlsafe_base64(16)
      session[:token] = @token
      @user.update_attributes(token: @token)

      redirect_to user_url(@user.id)
    else
      render :text => "invalid login"
    end
  end

end
