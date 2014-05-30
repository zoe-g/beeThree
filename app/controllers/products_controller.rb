class ProductsController < ApplicationController
  include ProductsHelper
  before_filter :product_check, only: [:show]

	def index
    @friends_sales = @current_user.friends_sales
	end

	def new
		@product = Product.new
	end
	
	def create
    @product = Product.new(product_params)
    if @product.save
      # adds a transaction record in UsersProducts to associate user as the seller of this product
      open = TxnStatus.find_by(name: 'Listed')
      seller = Role.find_by(name: 'Seller')
      UsersProducts.create(user_id: @current_user.id, product_id: @product.id, role_id: seller.id, txn_status_id: open.id)
      redirect_to @product, notice: 'Item was successfully created.'
    else
      redirect_to new_product_path, notice: 'Item was NOT created. Please try again.'
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
    else
    redirect_to @product, notice: 'Item was NOT updated. Please try again.'
  	end
  end

  def show
		@product = Product.find(params[:id])
	end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end

  private
	  def product_params
	    params.require(:product).permit(:avatar, :name, :description, :price)
	  end
end
