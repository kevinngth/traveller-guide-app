class ReviewsController < ApplicationController
    def new
    @user = current_user
    
    end

    def create
        @review = Review.new(review_params)

        @review.save
        redirect_to @review
    end

    def show
    @review = Review.all
    
    end
    private

    def review_params
        params.require(:review).permit(:user_id, :guide_id, :body)
    end
end
