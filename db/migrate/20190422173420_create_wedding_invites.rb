class CreateWeddingInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_invites do |t|
      t.string :email
      t.integer :wedding_guest_id
      t.integer :wedding_id
      t.string :token
      t.timestamps
    end
  end
end
