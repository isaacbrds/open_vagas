class HomeController < ApplicationController
  def index
    @positions = Position.where(publish: true).order(created_at: :desc)
  end
end
