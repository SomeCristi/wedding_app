class AddNameToWedding < ActiveRecord::Migration[5.2]
  def change
     add_column :weddings, :name, :string 
  end
end
