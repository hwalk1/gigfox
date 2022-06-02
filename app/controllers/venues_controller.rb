class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
        venues.name ILIKE :query \
        OR venues.description ILIKE :query \
        OR venues.location ILIKE :query \
      "
      @venues = Venue.where(sql_query, query: "%#{params[:query]}%")
    else
      @venues = Venue.all
    end

    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        # image_url: helpers.asset_url(venue.picture_url)
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
        # image_url: helpers.asset_url(@venue.picture_url)
      }]
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    @venue.save
    authorize @venue
    redirect_to venue_path(@venue)
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


  private

  def venue_params
    params.require(:venue).permit(:name, :description, :location, :price_per_hour, :room_size, :photo) #Says look inside params, look for a key restaurant and permit categories.
  end
end
