class SessionsController < ApplicationController
  def new
      if (session[:denied])
        flash.now[:error] = "You must Login first"
        session.delete(:denied)
      end

    end

  def create
      user = User.authenticate(params[:session][:email], params[:session][:password])
      if (user.nil?)
        flash.now[:error] = "Invalid Email / Password Confirmation"
        render :new
      else
        sign_in user
        session[:user_attributes] = user.attributes
        redirect_to :controller => 'sessions', :action => 'dashboard'
      end
  end

  def destroy
    sign_out
    session.clear
    redirect_to '/login'
  end

  def dashboard
    if signed_in?
      require 'open-uri'
      @data = open('https://api.coinmarketcap.com/v1/ticker/') { |io| io.read }
      @rdata = JSON.parse(@data)
    else
      deny_access
    end
  end
end
