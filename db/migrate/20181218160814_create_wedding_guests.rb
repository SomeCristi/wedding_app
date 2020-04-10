class CreateWeddingGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_guests do |t|
      t.string :name
      t.integer :table

      t.timestamps
    end
  end
end
