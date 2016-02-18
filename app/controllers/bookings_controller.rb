class BookingsController < ApplicationController
  before_action :set_kitten, only: [:new, :create]
  before_action :set_booking, only: [:show, :update]

  def show
    @kitten = @booking.kitten
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.kitten = @kitten
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_kitten
    @kitten = Kitten.find(params[:kitten_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end
end
