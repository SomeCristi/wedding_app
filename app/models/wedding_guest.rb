require 'csv'
# require 'smarter_csv'
class WeddingGuest < ActiveRecord::Base
  belongs_to :wedding
  has_one :wedding_invite
  after_create :set_confirmation_token
  enum attending: [:unspecified, :accepted, :declined], _suffix: true #https://api.rubyonrails.org/v5.2.3/classes/ActiveRecord/Enum.html   cauta dupa same
  enum plus_one: [:no, :yes, :unspecified], _suffix: true
  enum menu: [:normal, :vegetarian, :unspecified], _suffix: true

  def self.import(file, wedding_id)
    options = {headers: true, encoding: "ISO-8859-1", row_sep: :auto}
    CSV.foreach(file.path, headers: true) do |row|
      WeddingGuest.create!(
        name: row["name"], 
        table: row["table"], 
        wedding_id: wedding_id, 
        email: row["email"], 
        attending: :unspecified,
        menu: :unspecified, 
        plus_one: :unspecified, 
        confirm_token: SecureRandom.urlsafe_base64.to_s
      ) unless WeddingGuest.where(email: row["email"], wedding_id: wedding_id).exists?
    end
  end

  def add_options(attendance, plus_one, menu)
    self.attending = attendance if attendance.present?
    self.plus_one = plus_one if plus_one.present?
    self.menu = menu if menu.present?
    self.confirm_token = nil
    self.save
  end

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
    self.save
  end
end
