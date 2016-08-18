class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_book, only: [:show, :update, :edit, :destroy]
	
	def index
		@books = Book.all
		@categories = Category.all
	end

	def new
		@book = Book.new
		load_form_data
	end

	def destroy
		@book.destroy
		redirect_to book_path(@book)
	end

	def edit
		load_form_data
	end

	def update
		if @book.update(book_params)
      		redirect_to book_path(@book)
    	else
      		load_form_data
      		render :edit
    	end
    end

    def show
    	if current_user
      		if @book.comments.where(user_id: current_user.id).any?
       			 @comment = @book.comments.where(user_id: current_user.id).first
      		else
        		@comment = @book.comments.build
      		end
    	end
    end

	private

	def load_form_data
		@categories = Category.all.collect {|c| [c.title, c.id ] }
	end

	def book_params
		params.require(:book).permit(:asdfdfh)
	end

	def set_book
		@book = Book.find(params[:id])	
	end

end
