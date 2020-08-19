class BookingsController < ApplicationController
  def create
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @booking = Booking.new(booking_params) # je crée une nouvelle variable + je lui donne les données de mon formulaire
    @airplane = Airplane.find(params[:airplane_id]) # je recupère l'id de airplane dans les params de ma page
    @booking.airplane_id = @airplane.id # je donne la donnée  recupérée en ligne 4
    @booking.user_id = current_user.id #je recupère la dernière donnée pour créer mon instance booking
    #@booking.save #maintenant qu ej'ai toutre sles odnnées j'enregsire
    #redirect_to airplane_path(@airplane)
    if @booking.save
       redirect_to dashboard_path, notice: 'Thank You For booking!'
      #format.json  { render json: Email.create(email_params) }
    else
       redirect_to airplane_path(@airplane), notice: 'Start again!'
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
