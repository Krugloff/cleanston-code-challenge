class OrdersController < ApplicationController
  def create
    Rails.logger.info params

    cookies.encrypted[:cart_id] = nil
    redirect_to cart_path
  end
end