class ReviewsController < ApplicationController
    def new
    @user = current_user
    @guide = params[:guide_id]
    @name = Guide.where(user_id = @guide)
    end

    def create
        @review = Review.new(review_params)
        
         @review.save

        redirect_to '/travellers'
        
    end

    def show
    @review = Review.find(params[:id])
    
    end
    private

    def review_params
        params.require(:review).permit(:guide_id, :user_id, :body)
    end
end
