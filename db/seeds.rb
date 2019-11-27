# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

def import_csv(book, filename)
  csv = CSV.parse File.read Rails.root.join("db", filename)
  csv.each do |row|
    word = book.words.build
    word.text = row[0]
    word.pronunciation = row[1]
    word.translation = row[2]
    word.save
  end
  puts filename + " imported"
end

book = Book.create title: "CET4", description: "全国大学英语四级考试词汇", image_url: "cet4.png"
import_csv book, "cet4.csv"

book = Book.create title: "TOEFL", description: "王玉梅托福词汇表", image_url: "toefl.png"
import_csv book, "toefl.csv"

book = Book.create title: "JLPT", description: "日语能力测试常见词汇", image_url: "jlpt.png"
import_csv book, "jlpt.csv"
