class CreateWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :weddings do |t|
      t.datetime :date
      
      t.timestamps
    end
  end
end
