module WeddingGuestsHelper
  def method_and_url
    if @wedding_guest.persisted?
      {
        method: :put,
        url: wedding_wedding_guest_path(@wedding, @wedding_guest)
      }
    else
      {
        method: :post,
        url: wedding_wedding_guests_path(wedding_id: @wedding.id)
      }
    end
  end

    def m_u
    if @expense.persisted?
      {
        method: :put,
        url: wedding_expense_path(@wedding, @expense)
      }
    else
      {
        method: :post,
        url: wedding_expenses_path(wedding_id: @wedding.id)
      }
    end
  end
end
