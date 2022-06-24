module ApplicationHelper
    def active_class(path)
        "active" if current_page?(path)
    end
    def is_seller?
        # puts (@users.find(params[:role]))*100
        # puts (users.find(params[:role]))*100
        current_user.role == 'Seller'
    end
    def is_buyer?
        # puts (@users.find(params[:role]))*100
        # puts (users.find(params[:role]))*100
        current_user.role == 'Buyer'
    end
end
