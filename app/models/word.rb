class Word < ApplicationRecord
  validates :text, presence: true
  belongs_to :book
  has_many :records
end
