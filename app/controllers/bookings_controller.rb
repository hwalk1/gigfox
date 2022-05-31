class BookingsController < ApplicationController
  def create
    authorize @booking
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to root_path
  end

  def destroy
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time,  :total_price, :status, :venue_id, :user_id)
  end
end
