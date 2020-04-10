class DropWeddingGifts < ActiveRecord::Migration[5.2]
  def change
    drop_table :wedding_gifts
  end
end
