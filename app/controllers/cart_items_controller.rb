class CartItemsController < ApplicationController

  # TODO: there is no any authorization for now
  def update
    # TODO: what if a few people will update one cart simultaneously? (positive lock?)
    # TODO: protection from negative numbers...
    @cart = cart_item.cart
    cart_item.update!(permitted_params)
    render template: "carts/show"
  end

  def destroy
    @cart = cart_item.cart
    cart_item.destroy
    render template: "carts/show"
  end

  private

    def permitted_params = params.require(:cart_item).permit(:quantity)

    def cart_item
      @cart_item ||= CartItem.find(params[:id])
    end
end