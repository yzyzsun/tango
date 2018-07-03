class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  validates_format_of :sid, with: /\A\d{10}\z/
  validates_presence_of :name
  validates_presence_of :major
  has_one :book
  has_many :records
end
