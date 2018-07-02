class WordsController < ApplicationController
  before_action :set_book
  before_action :set_word, only: [:show, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_book_ownership!, only: [:new, :create, :destroy]

  # GET /books/1/words/1
  def show
    redirect_to books_path, alert: "单词本中不存在该单词！" if @word.book != @book
    @custom_book = current_user.book
    @custom_word = @custom_book.words.build(@word.attributes)
    @exist = @custom_book.words.find_by_text(@word.text)
  end

  # GET /books/1/words/new
  def new
    @word = @book.words.build
  end

  # POST /books/1/words
  def create
    @word = @book.words.build(word_params)
    if @word.save
      respond_to do |format|
        format.html { redirect_to @book, notice: "单词添加成功！" }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js { render js: "alert('加入单词本失败！')" }
      end
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

    def authenticate_book_ownership!
      redirect_to @book, alert: "没有权限编辑该单词本中的单词！" if @book.user != current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:text, :pronunciation, :translation, :book_id)
    end
end
