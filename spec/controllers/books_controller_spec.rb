require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }

    it 'renders the show template' do
      get :show, params: { id: book.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'POST #borrow' do
    let(:book) { create(:book) }
    let(:borrower) { create(:borrower) }

    it 'creates a lending record' do
      expect {
        post :borrow, params: { id: book.id, borrower_id: borrower.id }
      }.to change(Lending, :count).by(1)
    end

    it 'redirects to the book show page' do
      post :borrow, params: { id: book.id, borrower_id: borrower.id }
      expect(response).to redirect_to(book)
    end
  end

  describe 'PATCH #return' do
    let(:book) { create(:book) }
    let(:borrower) { create(:borrower) }
    let!(:lending) { create(:lending, book: book, borrower: borrower, returned_at: nil) }

    it 'updates the lending record' do
      patch :return, params: { id: book.id }
      lending.reload
      expect(lending.returned_at).to be_present
    end

    it 'redirects to the book show page' do
      patch :return, params: { id: book.id }
      expect(response).to redirect_to(book)
    end
  end
end