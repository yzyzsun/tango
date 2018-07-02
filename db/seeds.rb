# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

cet4 = Book.create title: "CET4", description: "全国大学英语四级考试大纲词汇", image_url: "cet4.png"
csv = CSV.parse File.read Rails.root.join('db', "cet4.csv")
csv.each do |row|
  word = cet4.words.build
  word.text = row[0]
  word.pronunciation = row[1]
  word.translation = row[2]
  word.save
end
