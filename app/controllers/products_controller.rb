class ProductsController < ApplicationController

def new
  	@product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "New product"
      redirect_to root_path
    else
      flash[:false] = "False!"
      redirect_to root_path
    end
  end


  def show
  	@product = Product.find(params[:id])
  end

  def index
  	@products = Product.all
  end

  private 
  	def product_params
  		params.require(:product).permit(:name, :company_id)
  	end

end
