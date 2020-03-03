class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorise_user!, only: [:update, :edit, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end


  def new
   @product = Product.new
  end


  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice:"Listing was successfully created"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  
def update
  @product = Product.find(params[:id])

  if @product.update(product_params)
    redirect_to @product
  else
    render 'edit'
  end
end

def destroy
product = Product.find(params[:id])
product.destroy

redirect_to products_path
end



  private
  def product_params
    params.require(:product).permit(:title, :description, :colour, :size, :price)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def authorise_user!
    return true if current_user == @product.user
  end

end
