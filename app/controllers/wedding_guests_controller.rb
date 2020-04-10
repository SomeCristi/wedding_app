class WeddingGuestsController < ApplicationController
  # before_action :authenticate_user!, only:[]
  before_action :set_wedding_guest, only: [:show, :edit, :update, :destroy, :invitation_response]
  before_action :set_wedding_with_permission, only: [:invitation_response, :rsvp]
  before_action :set_wedding, except: [:invitation_response, :rsvp]

  def index
    @wedding_guests = WeddingGuest.where(wedding_id: @wedding.id)
  end

  def show
  end

  def new
    @wedding_guest = WeddingGuest.new
  end

  def edit
  end

  def create
    is_part_of_wedding?(current_user, @wedding)
    if WeddingGuest.where(email: wedding_guest_params["email"]).exists?
      flash[:notice] = "Guest already exists"
      redirect_back(fallback_location: root_path) 
    else
      @wedding_guest = WeddingGuest.new(wedding_guest_params)
      @wedding_guest.wedding_id = @wedding.id
      @wedding_guest.attending = :unspecified
      @wedding_guest.menu = :unspecified
      @wedding_guest.plus_one = :unspecified
      respond_to do |format|
        if @wedding_guest.save
          format.html { redirect_to wedding_wedding_guest_path(@wedding,@wedding_guest), notice: 'Wedding guest was successfully created.' }
          format.json { render :index, status: :created, location: @wedding_guest }
        else
          format.html { render :new }
          format.json { render json: @wedding_guest.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @wedding_guest.update(wedding_guest_params)
        format.html { redirect_to wedding_wedding_guest_url(@wedding,@wedding_guest), notice: 'Wedding guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding_guest }
      else
        format.html { render :edit }
        format.json { render json: @wedding_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wedding_guest.destroy
    respond_to do |format|
      format.html { redirect_to wedding_wedding_guests_url(@wedding), notice: 'Wedding guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    WeddingGuest.import(params[:file], params[:wedding_id]) unless params[:file].nil?
    redirect_to wedding_wedding_guests_path(@wedding), notice: "Wedding Guests Added Successfully!"
  end

  def invitation_response
  end

  def rsvp
    token = params["wedding_guest"]["token"]
    unless token.blank?
      guest = WeddingGuest.where(confirm_token: token).first
      guest.add_options(params["wedding_guest"]["attending"], params["wedding_guest"]["plus_one"], params["wedding_guest"]["menu"])
      flash[:notice] = "Thank you for responding!"
      redirect_to wedding_path(params["wedding_id"])
    end
  end

  def send_one_invite
    wedding = Wedding.find(params.dig("wedding_id"))
    wedding_guest = WeddingGuest.find(params.dig("id"))
    WeddingGuestMailer.attendance_confirmation(wedding_guest, wedding).deliver_now
    flash[:notice] = "Invitation sent successfully"
    redirect_to wedding_wedding_guests_path(@wedding)
  end

  private
  def set_wedding_guest
    @wedding_guest = WeddingGuest.find(params[:id])
  end

  def wedding_guest_params
    params.require(:wedding_guest).permit(:name, :table, :email, :attending, :plus_one, :menu, :wedding_id)
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
    is_part_of_wedding?(current_user, @wedding)
  end

  def set_wedding_with_permission
    @wedding = Wedding.find(params[:wedding_id])
  end
end
