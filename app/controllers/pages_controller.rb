class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
  end
end
