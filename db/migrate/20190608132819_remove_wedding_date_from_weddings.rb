class RemoveWeddingDateFromWeddings < ActiveRecord::Migration[5.2]
  def change
    remove_column :weddings, :wedding_date
  end
end
