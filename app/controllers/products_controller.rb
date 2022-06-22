class ProductsController < ApplicationController
#   protect_from_forgery with: :exception
    # before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!

# #     after_action : 
#   def after_sign_in_path_for(products)
#    render "Products/new", :locals => { :product => @new_product } #or any route that you want use
#   end
  def new
    @product= Product.new
  end
  def index
    @product= Product.all
  end
# def valid?
#     @product['name']  = "can't be blank" if product.name?
#     @product['price']   = "can't be blank" if product.price?
#     @product['quantity'] = "can't be blank" if product.quantity?
# end        
def create
    @product =Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to products_path
    else
      render :new
    end
    authorize @product
end   
def show
    @product = Product.find(params[:id])
end
def index
    @products= current_user.products
end

def edit
    @product = Product.find(params[:id])
end
def update
    @product = current_user.products.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
end
def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
end
private
def product_params
    params.require(:product).permit(:name, :serial_number, :price)
end
protected
def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
end
end
