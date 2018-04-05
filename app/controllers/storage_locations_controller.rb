class StorageLocationsController < ApplicationController
	before_action :all_user_storage_locations, only: [:index, :create]
	respond_to :html, :js

  def new
    @storage_location = current_user.storage_locations.new
  end

	def create
	    @storage_location = current_user.storage_locations.build(storage_location_params)
  		respond_to do |format|
    		if @storage_location.save
		      format.html { redirect_to current_user, notice: 'Storage Location was successfully created.' }
		      format.js
		      format.json { render json: @storage_location, status: :created, location: current_user }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @storage_location.errors, status: :unprocessable_entity }
		    end
		  end
  	end

  def show
    @storage_location = StorageLocation.find(params[:id])
  end

private
  def storage_location_params
  	params.fetch(:storage_location, {}).permit(:name, :picture)
  end

  def all_user_storage_locations
      @storage_locations = current_user.storage_locations
  end
end