class BooksController < ApplicationController
  before_action :authenticate_user!

  # GET /books
  def index
    @books = [current_user.book]
    @books += Book.where user_id: nil
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
    redirect_to books_path, alert: "没有权限查看该单词本！" unless @book.user.nil? || @book.user == current_user
    @words = @book.words.order(:id).page params[:page]
  end
end
