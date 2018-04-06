class SectionsController < ApplicationController
	before_action :all_storage_location_sections, only: [:index, :create]
	respond_to :html, :js

  def new
    @section = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("storage").sections.new
  end

	def create
	    @section = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("storage").sections.build(section_params)
  		respond_to do |format|
    		if @section.save
    			ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("storage").sections << @section
		      	format.html { redirect_to current_user, notice: 'Section was successfully created.' }
		      	format.js
		      	format.json { render json: @section, status: :created, location: @section }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @section.errors, status: :unprocessable_entity }
		    end
		  end
  	end

  def show
    @section = Section.find(params[:id])
  end

private
  def section_params
  	params.fetch(:section, {}).permit(:name, :picture)
  end

  def all_storage_location_sections
      @sections = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("storage").sections
  end
end