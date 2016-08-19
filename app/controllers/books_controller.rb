class BooksController < ApplicationController
	before_action :authenticate_editor!, only: [:new, :create, :update, :edit, :destroy] 
  before_action :set_book, only: [:show, :update, :edit, :destroy]
	
  def mywishlist
    @books = current_user.wishes
  end

  def okudugumpirincler
    @books = current_user.okunmus
  end
	
  def index
  		@books = Book.all
  		
 	end

	def show
	end

	def new
		@book = Book.new
		load_data
	end

	def create 
		@book = Book.new(book_params)
		if @book.save
      	redirect_to books_path, notice: "Book was saved"
    else
    		load_data
      	render :new, notice: "Book couldn't saved"
    end
  end

	def edit
		load_data
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      load_data		
      render :edit
    end
	end

  def destroy
    @book.destroy
    redirect_to books_path
  end

	private

	def set_book
		@book = Book.find(params[:id])
	end

	def load_data
		@categories = Category.all.collect {|c| [c.title, c.id]}
		@publishers = Publisher.all.collect {|c| [c.name, c.id]}
		@interpreters = Interpreter.all.collect {|c| [c.name, c.id]}
		@authors = Author.all.collect {|c| [c.name, c.id]}
	end

	def book_params
		params.require(:book).permit(:name, :description, :page_count, :publication_year, :ISBN, :category_id, :author_id, :publisher_id, :interpreter_id)
	end
end
