class RemoveTotalCostFromWeddings < ActiveRecord::Migration[5.2]
  def change
    remove_column :weddings, :total_cost
  end
end
