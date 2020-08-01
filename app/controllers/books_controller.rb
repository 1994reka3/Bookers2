class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice]='You have created book successfully.'
      redirect_to book_path
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
