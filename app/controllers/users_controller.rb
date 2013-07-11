class UsersController < ApplicationController
  before_filter :signed_in?, :except => [:new, :create]

  def activate
    if params[:activation_token] = User.find_by_activation(params[:activation_token]).activation
      @user = User.find_by_activation(params[:activation_token])
      @user.activation = "true"
      @user.save!
      render :text => "You are activated"
    end
  end


  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    activation_token = SecureRandom.urlsafe_base64
    params[:user][:activation] = activation_token
    @user = User.create!(params[:user])
     msg = UserMailer.welcome_email(@user, activation_token)
     msg.deliver!
    redirect_to user_url(@user.id)
  end

  def update
    @user = User.find(params[:user])
    @user.update_attributes(params[:user])
    redirect_to user(@user.id)
  end


end
