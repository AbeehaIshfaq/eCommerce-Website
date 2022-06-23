class ProductsController < ApplicationController
#   protect_from_forgery with: :exception
    # before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    before_action :initialize_session
    before_action :load_cart
# #     after_action : 
#   def after_sign_in_path_for(products)
#    render "Products/new", :locals => { :product => @new_product } #or any route that you want use
#   end
  def new
    @product= Product.new
  end
  def index
    @product= Product.all.with_attached_images
    # session[:visit_count] ||=1
    # session[:visit_count] +=1
    # @visit_count = 1
  end

  def add_to_cart
    # session[:cart]<<params[:id]
    # redirect_to products_path
    id = params[:id].to_i
    session[:cart]<<id unless session[:cart].include?(id)
    redirect_to products_path
  end
# def valid?
#     @product['name']  = "can't be blank" if product.name?
#     @product['price']   = "can't be blank" if product.price?
#     @product['quantity'] = "can't be blank" if product.quantity?
# end        
def create
    @product =Product.new(product_params)
    @product.user_id = current_user.id
    # product.images.attach(params[:message][:images])
    authorize @product
    byebug
    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
end   
def show
    @product = Product.find(params[:id])
end
def index
   # @products= current_user.products
   @products= Product.all
end
def remove_from_cart
  id=params[:id].to_i
  session[:cart].delete(id)
  redirect_to products_path
end
def edit
    @product = Product.find(params[:id])
    authorize @product
end
def update
    @product =Product.find(params[:id])
    authorize @product
    @product.update(product_params)
    redirect_to product_path(@product)
end
def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to root_path
end
private
def product_params
    params.require(:product).permit(:name, :serial_number, :price, :image)
end
def initialize_session
  session[:visit_count] ||=0
  session[:cart] ||=[]
end
def load_cart
  @cart=Product.find(session[:cart])
end
protected
def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role, :picture)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
end
end
