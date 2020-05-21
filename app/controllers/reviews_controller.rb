class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @book.reviews
  end

  def show
  end

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params) 

    if @review.save
      redirect_to [@book, @review]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to [@book, @review]
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to book_reviews_path
  end

  private
    def set_book
      @book = Book.find(params[:books_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user, :title, :body )
    end
end
