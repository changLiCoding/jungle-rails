class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @products = @categories.map {
      |category| {
        product: Product.where(category_id: category.id)

      }
    }
  end



end
