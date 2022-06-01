class BookingsController < ApplicationController
  def create

    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.venue = @venue
    @booking.total_price = @venue.price_per_hour * @booking.duration.to_i
    @booking.end_time = @booking.start_time + @booking.duration.to_i.hours
    @booking.save
    redirect_to root_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :duration)
  end
end
