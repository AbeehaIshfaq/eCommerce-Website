class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
#   protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
# #     after_action : 
#   def after_sign_in_path_for(products)
#    render "Products/new", :locals => { :product => @new_product } #or any route that you want use
#   end
include Pundit::Authorization
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
protected
def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
end

private

def user_not_authorized
  flash[:alert] = 'You are not authorized to perform this action.'
  redirect_to products_index_path
end
end
