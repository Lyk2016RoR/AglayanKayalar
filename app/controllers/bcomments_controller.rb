class BcommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_book
	before_action :set_bcomment, only: [:destroy]
	before_action :authorize_user!, only: [:create, :destroy]


	def create 
		@bcomment = @book.bcomments.new(bcomment_params)
    	@bcomment.user = current_user
		if @bcomment.save
      		redirect_to @book, notice: "Comment was saved"
    	else
      		redirect_to @book, notice: "Comment couldn't saved"
    	end
	end

	def destroy
    	@bcomment.destroy
    	redirect_to @book, notice: "Comment was deleted"
  	end

	private

	def set_bcomment
  		@bcomment = Bcomment.find(params[:id])
	end

	def authorize_user!
  		redirect_to @book, notice: "Not authorized" unless @bcomment.user_id == current_user.id
	end

	def bcomment_params
  		params.require(:bcomment).permit(:body)
	end

	def set_book
  		@book = Book.find(params[:book_id])
	end


end
