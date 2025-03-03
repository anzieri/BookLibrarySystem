class Lending < ApplicationRecord
  belongs_to :book
  belongs_to :borrower

  validates :book, presence: true
  validates :borrower, presence: true
end
