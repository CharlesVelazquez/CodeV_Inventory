class ItemsController < ApplicationController
	before_action :all_items, only: [:index, :create]
	respond_to :html, :js

  def new
    @item = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("container").items.new
  end

	def create
    binding.pry
	    @item = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("container").items.build(item_params)
  		respond_to do |format|
    		if @item.save
    			ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("container").items << @item
		      	format.html { redirect_to current_user, notice: 'Item was successfully created.' }
		      	format.js
		      	format.json { render json: @item, status: :created, location: @item }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @item.errors, status: :unprocessable_entity }
		    end
		  end
  	end

  def show
    @item = Item.find(params[:id])
  end

private
  def item_params
  	params.fetch(:item, {}).permit(:name, :picture, :description, :reciept_picture, :qty, :min, :max, :value, :uid, :obtained_date)

  end

  def all_items
      @items = ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache').read("container").items
  end
end