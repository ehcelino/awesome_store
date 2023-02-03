class ApplicationController < ActionController::Base
  before_action :set_render_cart
  # before_action :initialize_cart
  before_action :cart_by_user

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])
    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def cart_by_user
    if current_user.nil?
      session[:cart_id] = nil
    else
      @cart ||= Cart.find_by(id: session[:cart_id])
      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end

end
