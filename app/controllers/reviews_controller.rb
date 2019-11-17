class ReviewsController < ApplicationController
    def new
    @user = current_user
    user_guide = params[:guide_id] #this is the user id of a guide
    @guide = Guide.find_by(user_id: params[:guide_id]).id #this is the guide id

    @name = User.find(user_guide)
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
        params.require(:review).permit(:guide_id, :user_id, :body, :rating)
    end
end