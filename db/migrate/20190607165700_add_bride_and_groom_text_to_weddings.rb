class AddBrideAndGroomTextToWeddings < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :bride_info, :string
    add_column :weddings, :groom_info, :string
  end
end
