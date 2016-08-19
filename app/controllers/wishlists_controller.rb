class WishlistsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_wishlist, only: [:destroy]
	before_action :authorize_user!, only: [:destroy]


	def create 
		@wishlist = current_user.wishlists.build
    	@wishlist.book_id = params[:wishlist][:book_id]
		if @wishlist.save
      		redirect_to mywishlist_books_path, notice: "Wishlist was saved"
    	else
      		redirect_to books_path, notice: "Wishlist couldn't saved"
    	end
	end

	def destroy
    	@wishlist.destroy
    	redirect_to @wishlist, notice: "Wishlist was deleted"
  	end

	private

	def set_wishlist
  		@wishlist = Wishlist.find(params[:id])
	end

	def authorize_user!
  		redirect_to @wishlist, notice: "Not authorized" unless @wishlist.user_id == current_user.id
	end

end
