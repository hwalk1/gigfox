class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @venues = policy_scope(Venue)
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
    authorize @venue
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
