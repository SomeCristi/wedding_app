class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :name
      t.float :price
      t.integer :wedding_id
      t.timestamps
    end
  end
end
