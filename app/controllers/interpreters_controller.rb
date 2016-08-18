class InterpretersController < ApplicationController
  	before_action :authenticate_editor!, only: [:new, :create, :update, :edit, :destroy] 
  	before_action :set_interpreter, only: [:show, :update, :edit, :destroy]
	
	def index
  		@interpreters = Interpreter.all
  	end

  	def show
  	end

  	def new
  		@interpreter = Interpreter.new
  	end

  	def create 
  		@interpreter = Interpreter.new(interpreter_params)
  		if @interpreter.save
        	redirect_to interpreters_path, notice: "İnterpreter was saved"
      else
        	render :new, notice: "interpreter couldn't saved"
      end
	  end

	  def edit
    end
	
	  def update
	    if @interpreter.update(interpreter_params)
	      redirect_to interpreter_path(@interpreter)
	    else
	      render :edit
	    end
  	end

    def destroy
      @interpreter.destroy
      redirect_to interpreters_path
    end

  	private

  	def set_interpreter
  		@interpreter = Interpreter.find(params[:id])
  	end

  	def interpreter_params
  		params.require(:interpreter).permit(:name)
  	end
end
