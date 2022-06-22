class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {Seller: 0, Buyer: 1}
  has_many :products
  def is_buyer?
    role == 'buyer'
  end

  def is_seller?
    role == 'seller'
  end

end
