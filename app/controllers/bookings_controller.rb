class BookingsController < ApplicationController

    def create
        @airplane = Airplane.find(params(:airplane_id))
        @booking = Booking.new(booking_params)
        @booking.airplane = @booking
        if @booking.save
            redirect_to airplane_path(@airplane)
        else
            render 'new'
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:airplane_id, :user_id)
    end


end
