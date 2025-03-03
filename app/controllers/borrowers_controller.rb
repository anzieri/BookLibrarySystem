class BorrowersController < ApplicationController
    def index
      @borrowers = Borrower.all
    end

    def show
      @borrower = Borrower.find(params[:id])
    end

    def new
      @borrower = Borrower.new
    end

    def create
      @borrower = Borrower.new(borrower_params)
      if @borrower.save
        redirect_to borrowers_path, notice: 'Borrower was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def borrower_params
      params.require(:borrower).permit(:name)
    end
end