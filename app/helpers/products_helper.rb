module ProductsHelper
#check to show prodcuts that you own and your friends own on show page

  def product_check
    accessible_products = current_user.friends_sales

    current_users_txns = UsersProducts.where(user_id: current_user.id)

    current_users_txns.each do |txn|
      accessible_products.push(txn.product)
    end

    # @product = Product.find(params[:id])
    unless accessible_products.include?(@product)
      redirect_to products_path, notice: "That product is not available."
    end
  end

end
