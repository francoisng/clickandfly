class AirplanesController < ApplicationController
  def index
    if params[:query].present?
      @airplanes = policy_scope(Airplane.search_by_model_and_category(params[:query]).geocoded )

    else
      @airplanes = policy_scope(Airplane.all.geocoded)
    end

    @markers = @airplanes.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { airplane: airplane }),
        image_url: helpers.asset_url('private_jet_icon.png')
      }
    end
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
      render "new"
    end
    authorize @airplane
  end

  private

  def airplane_params
    params.require(:airplane).permit(:address, :model, :category, :seat_capacity, :range, :daily_price, photos: [])
  end
end
