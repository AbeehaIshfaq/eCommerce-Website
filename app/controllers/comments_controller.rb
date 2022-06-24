class CommentsController < ApplicationController
    def index
        @comment = Comment.all 
      end
    
      def new
        user = session[:user_id]
        @comment = Comment.new(product_id: params[:product_id])
        @product = Product.find(params[:product_id])
      end
    
      def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        # @comment.product_id = params[:product_id]
        if @comment.save
          flash[:notice] = "comment created."
          redirect_to products_path
        else
          flash[:error] = "Error creating comment."
          redirect_to products_path
        end
      end
    
      def edit
        @comment = Product.find(params[:id])
      end
    
      def update
        @comment = Comment.find_by_id(params[:id])
        @comment.update(comment_params)
        flash[:notice] = "Comment updated."
        redirect_to products_path
      end
    
      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to products_path
      end
      def show
        
        @comments = Product.find(params[:id]).comments
      end
      private 
    
        def comment_params
          params.require(:comment).permit(:body, :user_id, :product_id)
        end
end
