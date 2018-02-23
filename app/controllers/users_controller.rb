class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :controller => 'users', :action => 'success'
      session[:user_attributes] = @user.attributes
    else
      render :index
    end
  end

  def success
    @user = User.new(session[:user_attributes])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
