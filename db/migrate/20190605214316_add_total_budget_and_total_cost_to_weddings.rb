class AddTotalBudgetAndTotalCostToWeddings < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :total_budget, :float 
    add_column :weddings, :total_cost, :float 
  end
end
