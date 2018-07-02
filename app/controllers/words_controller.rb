class WordsController < ApplicationController
  before_action :set_book
  before_action :set_word, only: [:show, :destroy]

  # GET /books/1/words/1
  def show
  end

  # GET /books/1/words/new
  def new
    @word = @book.words.build
  end

  # POST /books/1/words
  def create
    @word = @book.words.build(word_params)
    if @word.save
      redirect_to @book, notice: "单词添加成功！"
    else
      render :new
    end
  end

  # DELETE /books/1/words/1
  def destroy
    @word.destroy
    redirect_to @book, notice: "单词删除成功！"
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:text, :pronunciation, :translation, :book_id)
    end
end
