class PagesController < ApplicationController
  def get_all_planners
    @planners = User.where(role: "planner")
  end
end
