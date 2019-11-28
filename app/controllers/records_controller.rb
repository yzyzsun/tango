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
    subquery = Record.where(user: current_user).to_sql
    unlearned = Word.joins("LEFT JOIN (#{subquery}) AS records ON records.word_id = words.id")
                    .where(book: book, records: { id: nil })
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
    @words = Word.includes(:records)
                 .where(book: @book, records: { user: current_user })
                 .order("records.id DESC")
    if @words.empty?
      redirect_to @book, notice: "👀 哎呀，目前还没背过任何单词~"
    else
      render
    end
  end

  # DELETE /books/1/giveup
  def giveup
    book = Book.find params[:id]
    current_user.records.each { |r| r.destroy if r.word.book == book }
    redirect_to book, notice: "1, 2... 空！已经把所有单词忘得干干净净了！"
  end
end
