class OkunmuspirincsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_okudugumpirinc, only: [:destroy]
	before_action :authorize_user!, only: [:destroy]


	def create 
		@okudugumpirinc = current_user.okunmuspirincs.build
    	@okudugumpirinc.book_id = params[:okunmuspirinc][:book_id]
		if @okudugumpirinc.save
      		redirect_to okudugumpirincler_books_path, notice: "Okudugumpirinc was saved"
    	else
      		redirect_to books_path, notice: "Okudugumpirinc couldn't saved"
    	end
	end

	def destroy
    	@okudugumpirinc.destroy
    	redirect_to @okudugumpirinc, notice: "Okudugumpirinc was deleted"
  	end

	private

	def set_okudugumpirinc
  		@okudugumpirinc = Okudugumpirinc.find(params[:id])
	end

	def authorize_user!
  		redirect_to @okudugumpirinc, notice: "Not authorized" unless @okudugumpirinc.user_id == current_user.id
	end



end
