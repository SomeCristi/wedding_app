class WeddingsController < ApplicationController
  require 'google_places'

  before_action :authenticate_user!, except: :show
  before_action :find_wedding, only: %i[send_invites search_restaurants update edit book_restaurant set_location]
  before_action :find_wedding_with_no_permission, only: :show
  before_action :check_if_planner, only: %i[create, new]
  before_action :check_toggled_users, only: :create
  before_action :initialize_new_wedding, only: :new
  before_action :set_location, only: :show
  after_action :set_location, only: :update
  @@toggled_users = []

  def index
    @weddings = User.find(current_user.id).weddings
  end

  def show
    @bride = @wedding.users.bride.first
    @groom = @wedding.users.groom.first
  end

  def new
    if current_user.planner?
      if @search.present?
        @name = @search["name"]
        @users = @users.search(@name)
      end
    end
  end

  def toggle_user
    user_id = params[:user_id].to_i

    toggled = if user_id.in?(@@toggled_users)
      @@toggled_users -= [user_id]
      true
    elsif @@toggled_users.size < 2
        @@toggled_users << user_id
      true
    else
      false
    end

    render json: {
      remaining_users: 2 - @@toggled_users.size,
      toggled: toggled,
      ids: @@toggled_users
    }
  end

  def create
    if check_toggled_users && bride_and_groom
      @wedding = Wedding.new
      @wedding.users << User.find(@@toggled_users)
      @wedding.users << current_user
      @wedding.currency = params.dig("wedding", "currency")
      @wedding.total_budget = params.dig("wedding", "total_budget")
      @wedding.name = @wedding.users.first.name.split.first + " & " +@wedding.users.second.name.split.first + "'s wedding"

      if params.dig("wedding", "avatar").present?
        @wedding.avatar.attach(params["wedding"]["avatar"])
      else
        @wedding.avatar.attach(io: File.open('app/assets/images/default_wedding_avatar.jpg'), filename: 'placeholder.jpg', content_type: 'image/jpg')
      end

      if @wedding.save
        @@toggled_users = []
        redirect_to @wedding
      else
         flash[:error] = @wedding.errors.full_messages.to_sentence
        initialize_new_wedding

        render 'new'
      end
    else
      initialize_new_wedding
      render 'new'
    end
  end

  def update
    if @wedding.update(wedding_params)
      @wedding.avatar.attach(update_params["avatar"]) unless update_params["avatar"].nil?
      flash[:notice] = "Wedding updated successfully!"
      set_location
      render 'show', data: { turbolinks: false }
    else
      flash[:error] = @wedding.errors
      render 'edit'
    end
  end

  def send_invites
    guests = WeddingGuest.where(wedding_id: params["id"])
    guests.each do |guest|
      WeddingGuestMailer.attendance_confirmation(guest, @wedding).deliver_now
    end
    flash[:notice] = "Invitations sent successfully"
    redirect_to wedding_wedding_guests_path(@wedding)
    # redirect_back(fallback_location: root_path)
  end

  def search_restaurants
    unless params[:query].nil?
      @client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])
      @spots = @client.spots_by_query(params[:query], types: ['restaurant'], detail: true)
    end
    #  multe rezultate la wedding bucuresti
    # ca sa dai catre google palces url te uiti aici https://stackoverflow.com/questions/30467556/how-do-i-get-a-direct-link-to-a-place-on-google-maps-with-the-place-id
    # o sa te fol de place id
  end

  def book_restaurant
    @wedding.update(restaurant_name: params[:name], address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
    render 'edit'
  end

  def set_location
    return @hash = {} if @wedding.address.nil? || @wedding.address.blank?

    unless @wedding.latitude.nil? || @wedding.longitude.nil? #daca nu se schimba lat si lon dupa aschimbarea doar a adresei atunci n verifica ca alt si lon sunt nil ci doar ca adresa nu e
      @hash = [{ lat: @wedding.latitude, lng: @wedding.longitude}]
    else
      @hash = get_latitude_and_longitude
    end

    return @hash
  end

  private

  def get_latitude_and_longitude
    result = Geocoder.search(@wedding.address).first.coordinates
    lat_lng_hash = Gmaps4rails.build_markers(@wedding) do |wedding, marker|
      marker.lat result.first
      marker.lng result.second
    end
    return [lat_lng_hash]
  end

  def initialize_new_wedding
    @@toggled_users = []
    @wedding = Wedding.new
    @users = User.includes(:user_weddings).where(user_weddings: { user_id: nil }).where.not(role: "planner")
    @search = params["search"]
  end

  def find_wedding
    @wedding = Wedding.find(params[:id])
  end

  def find_wedding_with_no_permission
    @wedding = Wedding.find(params[:id])
  end

  def update_params
    params.require(:wedding).permit(:avatar)
  end

  def wedding_params
    params.require(:wedding).permit(:restaurant_name, :address, :date, :total_budget, :bride_info, :groom_info, :invitation_text, :currency)
  end

  def check_toggled_users
    if @@toggled_users.size < 2
      flash[:notice] = "You must select 2 users."
      false
    else
      true
    end
  end

  def bride_and_groom
    if User.find(@@toggled_users.first).role != User.find(@@toggled_users.second).role
      true
    else
      flash[:notice] = "You must select a bride and a groom"
      false
    end
  end

end
