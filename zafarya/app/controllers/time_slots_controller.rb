class TimeSlotsController < ApplicationController

    before_action :authenticate_user!
    
    def show
        @timeslot = TimeSlot.find(params[:id])
        @adventure = @timeslot.activity_date.adventure
        render json: @adventure        
    end
    
   
    def destroy
            @timeslot = TimeSlot.find(params[:id])
            @adventure = @timeslot.activity_date.adventure
            @timeslot.destroy
            render :nothing => true 
          
           
    end
    
    private
    def timeslot_params
        params.require(:timeslot).permit(:start_time, :end_time)
        
    end

end
