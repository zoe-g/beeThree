class SessionsController < ApplicationController
  #setting up sessions create method for facebook login. When user logs in via facebook, Facebook will redirect user back to beeThree and look for sessions#create.
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end
end