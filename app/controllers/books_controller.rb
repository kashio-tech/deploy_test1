class BooksController < ApplicationController
before_action :authenticate_user!
def index
	@books = Book.all
	# @books = Book.page(params[:page]).reverse_order
	@book = Book.new
	@user = current_user
end
def new
	@book = Book.new
end
def create
	@book = Book.new(book_params)
	@book.user_id = current_user.id
	if @book.save
		redirect_to book_path(@book)
		flash[:create] = "You have created book successfully."
	else
		@books = Book.page(params[:page]).reverse_order
		render :index
	end
end
def show
	@book = Book.find(params[:id])
	@book1  = Book.new
end
def edit
	@book = Book.find(params[:id])
	if current_user.id == @book.user.id
	else
	redirect_to books_path
	end
end
def update
	@book = Book.find(params[:id])
	if @book.update(book_params)
	flash[:update] = "You have updated book successfully."
	redirect_to book_path(@book)
	else
	render :edit
	end
end

def destroy
	@book = Book.find(params[:id])
	@book.destroy
	redirect_to books_path
end

private
	def book_params
	params.require(:book).permit(:title, :body)
	end
end
