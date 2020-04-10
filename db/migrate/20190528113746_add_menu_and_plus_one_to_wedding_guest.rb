class AddMenuAndPlusOneToWeddingGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_guests, :plus_one, :integer
    add_column :wedding_guests, :menu, :integer 
  end
end
