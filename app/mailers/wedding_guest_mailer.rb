class WeddingGuestMailer < ApplicationMailer
   default :from => "application_name@domain.com"
   
  def attendance_confirmation(wedding_guest, wedding)
    @wedding_guest = wedding_guest
    @wedding = wedding
    mail(to: @wedding_guest.email, subject: 'Wedding Invitation')
  end

end
