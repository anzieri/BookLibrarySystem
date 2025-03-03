class Book < ApplicationRecord
    has_many :lendings
    has_many :borrowers, through: :lendings

    validates :title, presence: true
    validates :author, presence: true

    def borrowed?
      lendings.where(returned_at: nil).exists?
    end
end
