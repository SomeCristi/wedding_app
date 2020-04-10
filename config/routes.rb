Rails.application.routes.draw do
  resources :weddings do
    resources :wedding_guests do
      collection { post :import }
      get :invitation_response, on: :member
      patch :rsvp, on: :member
      get :send_one_invite, on: :member
    end
    resources :expenses
    put :toggle_user, on: :collection
    get :send_invites, on: :member
    get :search_restaurants, on: :member
    get :book_restaurant, on: :member
    # put 'import', on: :member
  end

  resources :invites


  # resources :wedding_guests do
    # collection { post :import }
  # end

  devise_for :users, controllers: {
  invitations: "invitations"
}
  root to: 'pages#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get :search_users, controller: :searches
  get :get_all_planners, controller:"pages"

end
