class AddCurrencyToWedding < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :currency, :string
  end
end
