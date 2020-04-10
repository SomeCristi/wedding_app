class RenameBudgetToExpense < ActiveRecord::Migration[5.2]
  def change
    rename_table :budgets, :expenses
  end
end
