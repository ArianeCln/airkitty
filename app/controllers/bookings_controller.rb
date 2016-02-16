class BookingsController < ApplicationController


  before_action :set_kitten


  def show

  end

  def new
    @kitten = Kitten.new
  end

  def create
    @booking = Booking.new(booking_params)
    @kitten.booking = @booking
    if @booking.save
      redirect_to booking_path(@kitten)
    else
      render "booking/show"
    end
  end

  def edit
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
    @kitten = Kitten.find(params[:id)
  end

  def booking_params
    params.require(:kitten).permit (:start_date, :end_date, :total_price, :accepted, :kitten_id, :user_id)
  end




end
