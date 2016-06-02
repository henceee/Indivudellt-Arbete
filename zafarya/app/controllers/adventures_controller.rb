
class AdventuresController < ApplicationController
  before_action :set_adventure, only:[:show,:edit,:update]
  before_action :authenticate_user!, except: [:show]
  
  def index
    @adventures = current_user.adventures
  end

  def show
    @photo = @adventure.photos
    @dates = @adventure.activity_dates
    
    @booked = Reservation.where("adventure_id = ? AND user_id = ?", @adventure.id, current_user.id).present? if current_user
    
    @reviews = @adventure.reviews
    @hasreviews = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @adventure = current_user.adventures.build
  end

  def create
    @adventure = current_user.adventures.build(adventure_params)
    if @adventure.save
      if params[:images]
        params[:images].each do |image|
          @adventure.photos.create(image:image)
        end
      end
      
      @photos = @adventure.photos
      
      if params[:activity_date]
          @date = @adventurue.activity_date.create(date)
          if params[:time_slots]
              params[:time_slots].each do |slot|
                @date.time_slots>>slot
              end
          end
      end
      
      
      redirect_to edit_adventure_path(@adventure), flash: {success: 'Adventure successfully created'}
    else
      flash[:alert] = "Something's gone wrong, please check your input!"
      render :new
    end
  end

  def edit
  
    if current_user.id == @adventure.user.id
     @photos = @adventure.photos
    else
      redirect_to root_path, flash: {alert: "We cannot let you do that, sorry."}
    end
  end

  def update
    
    if @adventure.update(adventure_params)
       if params[:images]
        params[:images].each do |image|
          @adventure.photos.create(image:image)
        end
      end
      
       @photos = @adventure.photos
     
     redirect_to edit_adventure_path(@adventure), flash: {sucess: "Adventure updated sucessfully."}
      else
        flash[:alert] = "Something's gone wrong, please check your input!"
        render :edit
      end
      
  end
  

  private
  def set_adventure
    @adventure = Adventure.find(params[:id])
  end
  
  def adventure_params
   params.require(:adventure).permit!
   # params.require(:adventure).permit(:activity_name,:description,:leader,:company_name,:adress,:max_perticipants,
                                     # :price,:currency,{:activity_dates=>[:dates]})

  end
  
end
