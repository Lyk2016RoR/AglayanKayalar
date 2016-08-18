class AuthorsController < ApplicationController
	   before_action :authenticate_editor!, only: [:new, :create, :update, :edit, :destroy] 
  	before_action :set_author, only: [:show, :update, :edit, :destroy]
	
	 def index
  		@authors = Author.all
  	end

  	def show
  	end

  	def new
  		@author = Author.new
  	end

  	def create 
		  @author = Author.new(author_params)
		  if @author.save
      		redirect_to authors_path, notice: "Author was saved"
    	else
      		render :new, notice: "Author couldn't saved"
    	end
	  end

	  def edit
		
	  end
	
	  def update
	    if @author.update(author_params)
	      redirect_to author_path(@author)
	    else
	      render :edit
	    end
  	end

    def destroy
      @author.destroy
      redirect_to authors_path
    end

  	private

  	def set_author
  		@author = Author.find(params[:id])
  	end

  	def author_params
  		params.require(:author).permit(:name, :surname, :biography)
  	end
end
