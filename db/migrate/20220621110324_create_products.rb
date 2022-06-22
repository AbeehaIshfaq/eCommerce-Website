class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :serial_number
      t.integer :price
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
