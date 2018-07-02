class BooksController < ApplicationController
  before_action :authenticate_user!

  # GET /books
  def index
    @books = current_user.books
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
    @words = @book.words.page params[:page]
  end
end
