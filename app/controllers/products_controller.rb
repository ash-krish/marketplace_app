class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end


  def new

    
  end


  def create
    product = Product.new(params[:product])
    product.save

    redirect_to product_path(product)
  end







  private
  def product_params
    product.require(:product).permit(:title, :body)
  end



end
