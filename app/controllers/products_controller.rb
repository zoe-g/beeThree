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
      redirect_to @product, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	@product.update(product_params)

  	if @product.save
  	redirect_to @product
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

