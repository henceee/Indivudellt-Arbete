class PagesController < ApplicationController
  def home
     @adventure = Adventure.all.limit(9)
  end
  
 def search
  	
  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end


  	if session[:loc_search] && session[:loc_search] != ""
  		@adventure_adress = Adventure.near(session[:loc_search], 5, order: 'distance')
  	else
  		@adventure_adress = Room.all
  	end

  	@search = @adventure_adress.ransack(params[:q])
  	@adventures = @search.result

  	@arrAdventures = @adventures.to_a

  	if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)

  		start_date = Date.parse(params[:start_date])
  		end_date = Date.parse(params[:end_date])+1

  		@adventures.each do |adventure|
  				
  			no_matching_slots = adventure.activity_dates.where.not(
  			     :date => start_date...end_date).limit(1)
  			

  			if no_matching_slots.length >0
  				@arrAdventures.delete(adventure)	
  			end	

  		end

  	end

  end
   
end
