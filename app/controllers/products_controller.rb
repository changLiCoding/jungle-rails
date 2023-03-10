class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    if Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
      @sale = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
    end
  end

  def show
    @product = Product.find params[:id]
  end

end
