# encoding: UTF-8

class CarsController < ApplicationController

	def index
		@cars = Car.all
	end

	# GET /car/1
	def show
		@car = Car.find(params[:id])

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# GET /car/new
	def new
		@car = Car.new

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# POST /car
	def create
		@car = Car.new(params[:car].permit([:name, :description, :category_id]))

    	respond_to do |format|
      		if @car.save
        		format.html { redirect_to @car}
        	else
        		format.html { render action: "new" }
      		end
    	end
    end
end