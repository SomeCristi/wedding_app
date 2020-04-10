class WeddingInvite < ActiveRecord::Base
  belongs_to :wedding_guest
  belongs_to :wedding

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.wedding_guest_id,self.wedding_id, Time.now, rand(3)].join)
  end
end
