class AddInvitationTextToWedding < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :invitation_text, :string
  end
end
