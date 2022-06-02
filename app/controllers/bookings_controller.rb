class BookingsController < ApplicationController
  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.venue = @venue
    @booking.total_price = @venue.price_per_hour * @booking.duration.to_i
    @booking.end_time = @booking.start_time + @booking.duration.to_i.hours
    @booking.song_url.match?(/(?<==).*/) && @booking.song_url = @booking.song_url.match(/(?<==).*/)[0]
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if params[:status] == 'active'
      @booking.active!
    elsif params[:status] == 'archived'
      @booking.archived!
    end
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :duration, :song_url)
  end

  def update_params
    params.require(:status).permit(:active, :archived)
  end
end
