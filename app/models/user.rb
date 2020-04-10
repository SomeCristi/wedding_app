class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_weddings, dependent: :destroy
  has_many :weddings, through: :user_weddings

  # after_initialize :set_default_role, if: :new_record?

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable 
# TO DO ADD PRESENCE OF AVATAR after using default avatar
  # validates_presence_of  :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar

  enum role: [:planner, :bride, :groom, :admin]

  # def set_default_role
  #   self.role ||= :client
  # end

  def self.search(name)
    if name
      where('name ILIKE ?', "%#{name}%")
    else
      all
    end
  end
end
