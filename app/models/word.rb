class Word < ApplicationRecord
  validates_presence_of :text
  belongs_to :book
  has_many :records
end
