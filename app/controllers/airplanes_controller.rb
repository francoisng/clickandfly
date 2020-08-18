class AirplanesController < ApplicationController

  def index
    @airplanes = policy_scope(Airplane).order(created_at: :desc)
  end

  def show
    @airplane = Airplane.find(params[:id])
    @booking = Booking.new
    authorize @airplane
  end

  def new
    @airplane = Airplane.new
    authorize @airplane
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
    authorize @airplane
  end

  private

  def airplane_params
    params.require(:airplane).permit(:address, :model, :category, :seat_capacity, :range, :daily_price)
  end
end

