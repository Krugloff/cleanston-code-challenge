class CartsController < ApplicationController
  def show
    # TODO: of course it will be cart based on current user info
    cart
  end

  # I need an action for creating a cart for internal use.
  # like reset state after removing/clearing
  def create
    cookies.encrypted[:cart_id] = generated_cart.id

    redirect_to cart_path
  end

  def destroy
    @cart = Cart.new
    cookies.encrypted[:cart_id] = @cart.id
    render :show
  end

  private

    def cart_id
      cookies.encrypted[:cart_id]
    end

    def cart
      @cart ||= cart_id.present? ? Cart.find(cart_id) : Cart.new
    end

    def generated_cart
      Cart.create!.tap do |fresh_cart|
        Product.limit(3).each do |product|
          fresh_cart
            .cart_items
            .find_or_create_by!(product_id: product.id, cart_id: fresh_cart.id)
            .update!(quantity: product.id.div(2).next)
        end
      end
    end
end