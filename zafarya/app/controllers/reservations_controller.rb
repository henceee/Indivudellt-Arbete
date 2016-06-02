class ReservationsController < ApplicationController
    
    before_action :authenticate_user!, except: [:notify]
    
    def preload
        adventure = Adventure.find(params[:adventure_id])
        today = Date.today
        
        ac_dates = adventure.activity_dates.where("date >= ?", today)
        dates = []
        if Reservation.any?
            ac_dates.each do |ac|
                Reservation.all().each do |res|
                    if ac.date != res.date
                        dates.push(ac)
                    end
                end
            end
        else
            dates = ac_dates
        end
        
        
        render json: dates
    end

    def stimes
        adventure = Adventure.find(params[:adventure_id])
        date = DateTime.parse(params[:date])
        slots = adventure.activity_dates.where("date == ? ",date)[0].time_slots
        
        render json: slots
    end
    
    def etimes
        
        endtime = TimeSlot.where("id == ?",params[:slot_id])[0].end_time
        
        render json: endtime
    end
    
       protect_from_forgery except: [:your_adventures]
       
    def your_adventures
        @adventures = current_user.reservations.where("status ==?",true)
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
            #send paypal request
            values= {
                business:'hencee-facilitator@gmail.com',
                cmd:'_xclick',
                upload:1,
                notify_url:'https://zafarya-hencee.c9users.io/notify',
                amount: @reservation.total_price,
                item_name: @reservation.adventure.activity_name,
                item_number: @reservation.id,
                quantity: 1,
                return: 'https://zafarya-hencee.c9users.io/your_adventures'
                
            }
            redirect_to  "https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.to_query
        
            flash[:success] = "Your reservation has been sucessfully created!";
        else
            flash[:alert] = "Something went wrong, please check your input!";
            redirect_to  @reservation.adventure
        end
       
    end
    
    protect_from_forgery except: [:notify]
    def notify
    params.permit!
    status = params[:payment_status]
    render nothing:true    
    
    reservation = Reservation.find(param[:item_number])
    
        if status == "completed"
            reservation.update_attributes status:true
        else
            reservation.destroy
        end
    end

    private
    def reservations_params
        params.require(:reservation).permit(:date, :start_time, :end_time, :perticipants, :price, :total_price, :adventure_id)
        
    end
end