class AddCoordinatesAndAddressToWedding < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :latitude, :float
    add_column :weddings, :longitude, :float
    add_column :weddings, :address, :string
    add_column :weddings, :restaurant_name, :string
  end
end
