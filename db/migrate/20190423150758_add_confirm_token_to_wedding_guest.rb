class AddConfirmTokenToWeddingGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_guests, :confirm_token, :string
  end
end
