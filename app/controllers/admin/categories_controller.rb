class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
    @products = @categories.map {
      |category| {
        product: Product.where(category_id: category.id)

      }
    }
    p @products
  end
end
