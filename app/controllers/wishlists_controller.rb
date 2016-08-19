class WishlistsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_book
	before_action :set_wishlist, only: [:create, :destroy]
	before_action :authorize_user!, only: [:destroy]


	def create 
		@wishlist = Wishlist.new(wishlist_params)
    	@wishlist.user = current_user
		if @wishlist.save
      		redirect_to books_path, notice: "Comment was saved"
    	else
      		redirect_to books_path, notice: "Comment couldn't saved"
    	end
	end

	def destroy
    	@wishlist.destroy
    	redirect_to @wishlist, notice: "Comment was deleted"
  	end

	private

	def set_wishlist
  		@wishlist = Wishlist.find(params[:id])
	end

	def authorize_user!
  		redirect_to @wishlist, notice: "Not authorized" unless @wishlist.user_id == current_user.id
	end

	def bcomment_params
  		params.require(:wishlist).permit()
	end

	def set_book
  		@book = Book.find(params[:book_id])
	end

end
