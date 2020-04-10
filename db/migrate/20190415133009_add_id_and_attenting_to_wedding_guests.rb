class AddIdAndAttentingToWeddingGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_guests, :email, :string
    add_column :wedding_guests, :attending, :integer
  end
end
