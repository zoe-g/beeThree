module SessionsHelper
	
  # Getter and setter for @current_user
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def venmo_check
    if current_user.venmo_access_token.nil?
      session[:return_to] = request.url

      redirect_to venmo_path, notice: "Please authenticate your Venmo account."
    end
  end

# user authorization
  def sign_in(user)
    cookies.permanent[:oauth_token] = user.oauth_token

    current_user = user
  end

  def signed_in? 
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      session[:return_to] = request.url

      redirect_to new_user_path, notice: "Please sign in."
    end
  end

  def sign_out 
    @current_user = nil
    cookies.delete(:oauth_token)
  end

end
