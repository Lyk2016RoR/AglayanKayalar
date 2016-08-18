class PublishersController < ApplicationController
	  before_action :authenticate_editor!, only: [:new, :create, :update, :edit, :destroy] 
  	before_action :set_publisher, only: [:show, :update, :edit, :destroy]
	
	  def index
  		@publishers = Publisher.all
  	end

  	def show
  	end

  	def new
  		@publisher = Publisher.new
  	end

  	def create 
		@publisher = Publisher.new(publisher_params)
		if @publisher.save
      		redirect_to publishers_path, notice: "Publisher was saved"
    	else
      		render :new, notice: "Publisher couldn't saved"
    	end
	  end

	  def edit
		
	  end
	
	  def update
	    if @publisher.update(publisher_params)
	      redirect_to publisher_path(@publisher)
	    else
	      render :edit
	    end
  	end

    def destroy
      @publisher.destroy
      redirect_to publishers_path
    end

  	private

  	def set_publisher
  		@publisher = Publisher.find(params[:id])
  	end

  	def publisher_params
  		params.require(:publisher).permit(:name)
  	end
end
