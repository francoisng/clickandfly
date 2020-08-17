class AirplanesController < ApplicationController

  def index
    @airplanes = Airplanes.all
  end

  def show
    @airplane = Airplane.find(params[:id])
    @booking = Booking.new
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    if @airplane.save
      redirect_to airplane_path(@airplane)
    else
      render 'new'
    end
  end
end
