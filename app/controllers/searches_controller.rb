class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :force_json, only: :search_users
  
  def index; end

  def search_users
    @users = User.includes(:user_weddings).where(user_weddings: { user_id: nil }).where.not(role: "planner").ransack(name_cont: params[:q]).result.limit(5)
  end

  private

  def force_json
    request.format = :json
  end
end
