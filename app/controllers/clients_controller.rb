# encoding: UTF-8

class ClientsController < ApplicationController

	def index
		@clients = Client.all
	end

	# GET /clients/1
	def show
		@client = Client.find(params[:id])

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# GET /clients/new
	def new
		@client = Client.new

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# POST /clients
	def create

		@client = Client.new(params[:client].permit([:firstname, :secondname, :pesel]))

    	respond_to do |format|
      		if @client.save
        		format.html { redirect_to @client}
        	else
        		format.html { render action: "new" }
      		end
    	end
    end

    def destroy
    	@client = Client.find(params[:id])
    	@client.destroy

    	respond_to do |format|
      		format.html { redirect_to clients_path }
  		end
  	end

end