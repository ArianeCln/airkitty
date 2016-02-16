class BookingsController < ApplicationController


  before_action :set_kitten


  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.renter = current_user
    @booking.kitten = @kitten
    @booking.accepted = false
    if @booking.save
      redirect_to kitten_booking_path(@kitten, @booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to kitten_booking_path(@kitten, @booking)
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:kitten_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :accepted)
  end
end
