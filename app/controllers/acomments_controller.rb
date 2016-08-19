class AcommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_author
	before_action :set_acomment, only: [:destroy]
	before_action :authorize_user!, only: [:destroy]


	def create 
		@acomment = @author.acomments.new(acomment_params)
    	@acomment.user = current_user
		if @acomment.save
      		redirect_to @author, notice: "Comment was saved"
    	else
      		redirect_to @author, notice: "Comment couldn't saved"
    	end
	end

	def destroy
    	@acomment.destroy
    	redirect_to @author, notice: "Comment was deleted"
  	end

	private

	def set_acomment
  		@acomment = Acomment.find(params[:id])
	end

	def authorize_user!
  		redirect_to @author, notice: "Not authorized" unless @acomment.user_id == current_user.id
	end

	def acomment_params
  		params.require(:acomment).permit(:body)
	end

	def set_author
  		@author = Author.find(params[:author_id])
	end
end
