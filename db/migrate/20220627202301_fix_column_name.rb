class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    add_monetize :products, :price, currency: { present: true }
    add_monetize :orders, :price, currency: { present: false }
  end
end
