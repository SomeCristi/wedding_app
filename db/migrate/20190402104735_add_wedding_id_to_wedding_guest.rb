class AddWeddingIdToWeddingGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_guests, :wedding_id, :integer
  end
end
