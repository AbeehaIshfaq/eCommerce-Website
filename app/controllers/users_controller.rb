class UsersController < ApplicationController
    def index
        @users = User.all
      end
    
      def new
        @user = User.new
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :picture)
      end
    
end
