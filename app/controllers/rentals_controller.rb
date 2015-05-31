# encoding: UTF-8

class RentalsController < ApplicationController

	def index
		@rentals = Rental.all

	end

	# GET /rentals/1
	def show
		@rental = Rental.find(params[:id])

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# GET /rentals/newstepone
	def new_step_one
		@dic = {:date_start => nil, :date_stop => nil}

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# GET /rentals/newsteptwo
	def new_step_two
		params.permit([:date_start, :date_stop])
		if params[:date_stop] > params[:date_start]
			all_rentals = Rental.all
			free_cars = Car.all.compact
			all_rentals.each do |rental|
				if not (rental.date_stop < params[:date_start].to_date or rental.date_start > params[:date_stop].to_date)
					free_cars.delete(rental.car)
				end
			end
			@cars = free_cars
			@clients = Client.all
			@rental = Rental.new(
				date_start: params[:date_start],
				date_stop: params[:date_stop]
				)
			respond_to do |format|
      			format.html # new.html.erb
    		end
    	else
    		render action: "new_step_one"
    	end
	end

	# POST /rentals
	def create

		@rental = Rental.new(params[:rental].permit([:car_id, :client_id, :date_start, :date_stop]))

    	respond_to do |format|
      		if @rental.save
        		format.html { redirect_to @rental}
        	else
        		format.html { render action: "new" }
      		end
    	end
    end

    def destroy
    	@rental = Rental.find(params[:id])
    	@rental.destroy

    	respond_to do |format|
      		format.html { redirect_to rentals_path }
  		end
  	end

end