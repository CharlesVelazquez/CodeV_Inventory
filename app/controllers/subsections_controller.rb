class SubsectionsController < ApplicationController
	before_action :all_subsections, only: [:index, :create]
	respond_to :html, :js

  def new
    @subsection = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("section").subsections.new
  end

	def create
	    @subsection = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("section").subsections.build(subsection_params)
  		respond_to do |format|
    		if @subsection.save
    			ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("section").subsections << @subsection
		      	format.html { redirect_to current_user, notice: 'Subsection was successfully created.' }
		      	format.js
		      	format.json { render json: @subsection, status: :created, location: @subsection }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @subsection.errors, status: :unprocessable_entity }
		    end
		  end
  	end

  def show
    @subsection = Subsection.find(params[:id])
  end

private
  def subsection_params
  	params.fetch(:subsection, {}).permit(:name, :picture)
  end

  def all_subsections
      @subsections = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("section").subsections
  end
end
