class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {Seller: 0, Buyer: 1}
  has_many :products
  has_many :comments
  def is_buyer?
    role== 'Buyer'
  end

  def is_seller?
    # puts (@users.find(params[:role]))*100
    # puts (users.find(params[:role]))*100
    role == 'Seller'
  end

end
