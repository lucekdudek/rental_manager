# encoding: UTF-8

class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	# GET /categorys/1
	def show
		@category = Category.find(params[:id])

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# GET /categorys/new
	def new
		@category = Category.new

		respond_to do |format|
      		format.html # new.html.erb
    	end
	end

	# POST /categorys
	def create

		@category = Category.new(params[:category].permit([:category, :price]))

    	respond_to do |format|
      		if @category.save
        		format.html { redirect_to @category}
        	else
        		format.html { render action: "new" }
      		end
    	end
    end

end