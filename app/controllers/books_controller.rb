class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit borrow update destroy return]

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @borrowers = Borrower.all # Add this line
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
    redirect_to books_path, notice: "Book was successfully destroyed.", status: :see_other
  end

  def borrow
    @borrower = Borrower.find(params[:borrower_id])
    if @book.borrowed?
      redirect_to @book, alert: 'Book is already borrowed.'
    else
      Lending.create(book: @book, borrower: @borrower, borrowed_at: Time.current)
      redirect_to @book, notice: 'Book borrowed successfully.'
    end
  end

  def return
    @lending = @book.lendings.find_by(returned_at: nil)
    if @lending
      @lending.update(returned_at: Time.current)
      redirect_to @book, notice: 'Book returned successfully.'
    else
      redirect_to @book, alert: 'Book is not currently borrowed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
