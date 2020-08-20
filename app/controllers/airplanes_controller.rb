class AirplanesController < ApplicationController
  def index
    if params[:query].present?
      @airplanes = policy_scope(Airplane.search_by_model_and_category(params[:query]).geocoded)
    else
      @airplanes = policy_scope(Airplane.all.geocoded)
    end

    @markers = @airplanes.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { airplane: airplane }),
        image_url: helpers.asset_url("private_jet_icon.png"),
      }
    end
  end

  def show
    @airplane = Airplane.geocoded.find(params[:id])
    @booking = Booking.new
    authorize @airplane
    @markers = [@airplane].map 
      {
        lat: @airplane.latitude,
        lng: @airplane.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { airplane: @airplane }),
        image_url: helpers.asset_url("private_jet_icon.png"),
      }
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

  def destroy
    @airplane = Airplane.find(params[:id])
    authorize @airplane
    @airplane.destroy
    redirect_to dashboard_path
  end

  def edit
    @airplane = Airplane.find(params[:id])
    authorize @airplane
  end

  def update
    @airplane = Airplane.find(params[:id])
    authorize @airplane
    @airplane.update(airplane_params)
    redirect_to dashboard_path
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  private

  def airplane_params
    params.require(:airplane).permit(:address, :model, :category, :seat_capacity, :range, :daily_price, photos: [])
  end
end
