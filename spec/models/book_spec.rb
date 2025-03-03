require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with a title and author' do
    book = Book.new(title: 'Simple Book', author: 'Simple Author')
    expect(book).to be_valid
  end

  it 'is not valid without a title' do
    book = Book.new(author: 'Simple Author')
    expect(book).to_not be_valid
  end

  it 'is not valid without an author' do
    book = Book.new(title: 'Simple Book')
    expect(book).to_not be_valid
  end

  it 'returns true if a book is borrowed' do
    book = create(:book)
    borrower = create(:borrower)
    create(:lending, book: book, borrower: borrower, returned_at: nil)
    expect(book.borrowed?).to be true
  end

  it 'returns false if a book is not borrowed' do
    book = create(:book)
    expect(book.borrowed?).to be false
  end
end