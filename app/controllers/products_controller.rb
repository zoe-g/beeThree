class ProductsController < ApplicationController
	
	def index
    @products = Product.all
	end

	def new
		@product = Product.new
	end
	
	def create
    @product = Product.new(product_params)

    if @product.save
    	binding.pry
      redirect_to @product, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
		@product = Product.find(params[:id])
	end

  private
	  def product_params
	    params.require(:product).permit(:avatar, :name, :description, :price)
	  end
end

