class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  # cm removed for authorization, method below not needed?
  before_filter :current_user

  before_filter :signed_in_user
end
