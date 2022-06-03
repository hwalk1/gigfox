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
    @venue = Venue.find(params[:id])
    authorize @venue

  end

  def update
    @venue = Venue.find(params[:id])
    authorize @venue
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: "Successfully updated a venue"
    else
      render :new
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    authorize @venue
    @venue.destroy
  end


  private

  def venue_params
    params.require(:venue).permit(:name, :description, :location, :price_per_hour, :room_size, :photo) #Says look inside params, look for a key restaurant and permit categories.
  end
end
