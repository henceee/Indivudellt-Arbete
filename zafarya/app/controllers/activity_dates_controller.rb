class ActivityDatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_date, only: [:show,:edit,:update]
     def new
        @date = ActivityDate.new
     end
    
    def create
        @date = ActivityDate.new(date_params.except(:time_slots))
        
            
        if @date.save
        redirect_to  @date.adventure 
        flash[:success] = "Date added!";
        else
        redirect_to  @date.adventure 
        flash[:alert] = "Something went wrong, please check your input";
        end
    end
    
 
    
    def update
        
        if @date.update(date_params)
            redirect_to  edit_adventure_path @date.adventure
            flash[:success] = "Date Updated!";
        else
       
            redirect_to  edit_activity_date_path @date 
            flash[:alert] = "Something went wrong, please check your input";
        end

    end


    private
    def date_params
        params.require(:activity_date).permit(:date, :adventure_id, time_slots_attributes:[ :start_time, :end_time ])
        
    end
    
    def set_date
        @date = ActivityDate.find(params[:id])
    end
end

###