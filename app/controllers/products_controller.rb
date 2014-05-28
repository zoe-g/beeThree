class ProductsController < ApplicationController
  attr_accessor :avatar, :name, :description, :price

	def index
    @products = Product.all
    # TODO: only pull in items with 'Listed' in the seller's txn_status (methods only can handle one pending request at a time currently)
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
      redirect_to new_product_path
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
