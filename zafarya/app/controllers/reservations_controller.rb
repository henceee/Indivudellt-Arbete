class ReservationsController < ApplicationController
    
    before_action :authenticate_user!
    
    def preload
        adventure = Adventure.find(params[:adventure_id])
        today = Date.today
        dates = adventure.activity_dates.where("date >= ?", today)
        
        render json: dates
    end

    def times
        adventure = Adventure.find(params[:adventure_id])
        date = DateTime.parse(params[:date])
        slots = adventure.activity_dates.where("date == ?",date)[0].time_slots
        
        render json: slots
    end
    
    def your_adventures
        @adventures = current_user.reservations
        render 'Reservations/your_adventures'
    end
    
    
	def your_reservations
		@adventures = current_user.adventures
		#render json: @adventures
		render 'Reservations/your_reservations'
	end
	
    def create
        @reservation = current_user.reservations.create(reservations_params)
        
        @reservation.total_price = @reservation.price * @reservation.perticipants
        
        if @reservation.save
            flash[:success] = "Your reservation has been sucessfully created!";
        else
            flash[:alert] = "Something went wrong, please check your input!";
        end
        redirect_to  @reservation.adventure
    end

    private
    def reservations_params
        params.require(:reservation).permit(:date, :start_time, :end_time, :perticipants, :price, :total_price, :adventure_id)
        
    end
end