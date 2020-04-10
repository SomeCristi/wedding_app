class ChangeTotalBudgetToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :weddings, :total_budget, :integer
  end
end
