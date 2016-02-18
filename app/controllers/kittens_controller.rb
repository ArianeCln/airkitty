class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    if !params[:search].blank?
      @kittens = Kitten.search(params[:search]).order("created_at DESC")
    else
      @kittens = Kitten.order('created_at DESC')
    end
    @kittens = @kittens.race(params[:race]) if params[:race].present?
    @kittens = @kittens.personality(params[:personality]) if params[:personality].present?
    @markers = Gmaps4rails.build_markers(@kittens) do |kitten, marker|
      marker.lat kitten.latitude
      marker.lng kitten.longitude
    end
  end

  def show
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @kitten_coordinates = { lat: @kitten.latitude, lng: @kitten.longitude }
    @booking = Booking.new(start_date: @start_date, end_date: @end_date)
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.owner = current_user
    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @kitten.update(kitten_params)
    redirect_to kitten_path(@kitten)
  end

  def destroy
    @kitten.destroy
    redirect_to user_path(current_user)
  end


  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :race, :address, :diet, :personality, :home_delivery, :price_per_day, :user_id, photos:[])
  end

end
