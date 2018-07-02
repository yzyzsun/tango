class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :words
end
