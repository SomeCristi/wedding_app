class AddDateToWedding < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :wedding_date, :time
  end
end
