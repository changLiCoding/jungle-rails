class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @products = Product.all
    @categories = Category.all
  end

  def get_info_of_store

  end

end
