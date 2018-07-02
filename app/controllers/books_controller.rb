class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :authenticate_user!

  # GET /books
  def index
    @books = current_user.books
  end

  # GET /books/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description, :image_url)
    end
end
