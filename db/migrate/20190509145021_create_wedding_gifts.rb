class CreateWeddingGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_gifts do |t|
      t.string :name
      t.boolean :taken
      t.integer :wedding_id
    end
  end
end
