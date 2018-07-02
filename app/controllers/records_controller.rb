class RecordsController < ApplicationController
  before_action :authenticate_user!

  # POST /records/1
  def record
    word = Word.find params[:id]
    if params[:remembered]
      record = word.records.find_by_user_id(current_user)
      if record
        record.time = Time.now
        record.save
      else
        word.records.create user: current_user, time: Time.now
      end
    end
    redirect_to learn_path(params[:book_id])
  end

  # GET /books/1/learn
  def learn
    book = Book.find params[:id]
    unlearned = book.words.find_all { |w| w.records.none? { |r| r.user == current_user } }
    word = unlearned.sample
    if word
      redirect_to [book, word]
    else
      redirect_to book, notice: "🎉 恭喜，所有单词都已经背完啦~"
    end
  end

  # GET /books/1/review
  def review
    @book = Book.find params[:id]
    @words = @book.words.find_all { |w| w.records.any? { |r| r.user == current_user } }
    if @words.empty?
      redirect_to @book, notice: "👀 诶呀，目前还没有要复习的单词~"
    else
      render
    end
  end
end
