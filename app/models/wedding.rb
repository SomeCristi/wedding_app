class Wedding < ApplicationRecord
  has_many :wedding_guests, foreign_key: "wedding_id", dependent: :destroy
  # has_many :wedding_gifts, foreign_key: "wedding_id", dependent: :destroy
  has_many :user_weddings, dependent: :destroy
  has_many :users, through: :user_weddings
  has_many :wedding_invitations
  has_many :expenses
  has_one_attached :avatar

  geocoded_by :address
  after_validation :geocode

  def toggle_user(user_id)
    if user_weddings.pluck(:user_id).include?(user_id)
      user_weddings.where(user_id: user_id).destroy_all
      return true
    else
      if user_weddings.size < 2
        user_weddings << UserWedding.create(wedding_id: id, user_id: user_id)
        return true
      end
    end

    false
  end

  def full_info_filled?
    %i[restaurant_name address date].map do |field|
      send(field)
    end.all?
  end
end
