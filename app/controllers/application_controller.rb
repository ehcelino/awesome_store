class ApplicationController < ActionController::Base
  require 'ostruct'

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    if @current_user
        @current_user
    else
      OpenStruct.new(username: 'Visitante')
    end
  end
  helper_method :current_user

end
