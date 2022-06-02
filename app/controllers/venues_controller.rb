class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @venues = policy_scope(Venue)

    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue }),
        map_marker: render_to_string(partial: "map_marker", locals: { venue: venue }),
        # image_url: @venue.picture_url || "https://res.cloudinary.com/hwalk1/image/upload/v1654148153/#{Rails.env}/#{@venue.photo.key}.jpg"
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
        map_marker: render_to_string(partial: "map_marker", locals: { venue: @venue }),
        # image_url: @venue.picture_url || "https://res.cloudinary.com/hwalk1/image/upload/v1654148153/#{Rails.env}/#{@venue.photo.key}.jpg"
      }]
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    authorize @venue
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue), notice: "Successfully created a venue"
    else
      render :new
    end

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
