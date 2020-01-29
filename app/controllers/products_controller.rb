class ProductsController < ApplicationController
  def index
  end

  def search
    products = ProductsSearchService.new(params[:query], params[:order], params[:filter]).call
    render json: products
  end
end
