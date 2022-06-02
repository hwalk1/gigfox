class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @venues = policy_scope(Venue)

    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        image_url: helpers.asset_url(venue.picture_url)
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
    authorize @venue

    @markers =
      [{
        lat: @venue.latitude,
        lng: @venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: @venue }),
        image_url: helpers.asset_url(@venue.picture_url)
      }]
  end

  def new
    authorize @venue
  end

  def create
    authorize @venue
  end

  def edit
    authorize @venue
  end

  def update
    authorize @venue
  end

  def destroy
    authorize @venue
  end
end
