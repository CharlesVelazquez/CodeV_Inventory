class ContainersController < ApplicationController
	before_action :all_containers, only: [:index, :create]
	respond_to :html, :js

  def new
    @container = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("subsection").containers.new
  end

	def create
	    @container = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("subsection").containers.build(container_params)
  		respond_to do |format|
    		if @container.save
    			ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("subsection").containers << @container
		      	format.html { redirect_to current_user, notice: 'Container was successfully created.' }
		      	format.js
		      	format.json { render json: @container, status: :created, location: @container }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @container.errors, status: :unprocessable_entity }
		    end
		  end
  	end

  def show
    @container = Container.find(params[:id])
  end

private
  def container_params
  	params.fetch(:container, {}).permit(:name, :picture)
  end

  def all_containers
      @containers = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("subsection").containers
  end
end