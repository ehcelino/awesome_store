class CartController < ApplicationController
  before_action :check_user
  
  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0 
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end
    if params[:from].to_i == 1
      return redirect_to cart_path
    else
    respond_to do |format|

      # format.html { redirect_to cart_path }

        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
          turbo_stream.replace('cart_qtty', partial: 'layouts/cart_qtty', locals: { cart: @cart })]
        end
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart }),
        turbo_stream.replace('cart_qtty', partial: 'layouts/cart_qtty', locals: { cart: @cart })]
        
      end
    end
  end

  private

  def check_user
    if current_user.nil?
      flash[:danger] = "É necessário estar logado."
      redirect_to root_path
    end
  end

end
