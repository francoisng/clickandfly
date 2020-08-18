class AirplanesController < ApplicationController

  def index
    @airplanes = Airplane.all
  end

  def show
    @airplane = Airplane.find(params[:id])
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @user = current_user
    @airplane = Airplane.new(airplane_params)
    @airplane.user = @user
    if @airplane.save
      redirect_to airplane_path(@airplane)
    else
      render 'new'
    end
  end

  private

  def airplane_params
    params.require(:airplane).permit(:address, :model, :category, :seat_capacity, :range, :daily_price)
  end
end

