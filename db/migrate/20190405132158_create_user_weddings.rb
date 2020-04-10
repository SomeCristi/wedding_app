class CreateUserWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_weddings do |t|
      t.integer :wedding_id
      t.integer :user_id
      t.timestamps
    end
  end
end
