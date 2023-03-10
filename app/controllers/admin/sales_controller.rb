class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new

  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'The Sale Has Deleted!'
  end
end
