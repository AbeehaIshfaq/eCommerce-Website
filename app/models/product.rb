class Product < ApplicationRecord
    belongs_to :user
    has_many :comments 
    has_one_attached :image
    monetize :price_cents
    has_many :orders
end
