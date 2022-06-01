class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
    @venues = current_user.venues
    @venue_bookings = []
    current_user.venues.each { |venue| venue.bookings.each { |booking| @venue_bookings << booking } }
  end
end
