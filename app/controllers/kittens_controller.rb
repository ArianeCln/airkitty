class KittensController < ApplicationController

  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    if params[:search]
      @kittens = Kitten.joins(:owner).search(params[:search]).order("created_at DESC")
    else
      @kittens = Kitten.order('created_at DESC')
    end
  end

  def show
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
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :race, :diet, :personality, :home_delivery, :price_per_day, :user_id, photos:[])
  end

end
