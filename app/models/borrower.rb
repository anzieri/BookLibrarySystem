class Borrower < ApplicationRecord
    has_many :lendings
    has_many :books, through: :lendings
    validates :name, presence: true
end
