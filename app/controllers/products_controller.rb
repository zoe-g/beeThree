class ProductsController < ApplicationController
	# This method associates the attribute ":avatar" with a file attachment
		  has_attached_file :avatar, styles: {
		    thumb: '100x100>',
		    square: '200x200#',
		    medium: '300x300>'
		  }

	# Validate the attached image is image/jpg, image/png, etc
  		validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	def index
    @products = Product.all
	end

	def new
	end
	
	def create
	    @product = Product.new(product_params)

	    if @product.save
	      redirect_to @product, notice: 'Item was successfully created.' }
	     else
	       render action: 'new'
	    end
  end

  private
	  def product_params
	    params.require(:product).permit(:avatar, :name, :description, :price)
	  end
end

