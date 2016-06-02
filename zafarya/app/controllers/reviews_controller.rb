class ReviewsController < ApplicationController
    
    def create
        #render json: reviews_params
        @review = current_user.reviews.create(reviews_params)
        redirect_to @review.adventure
    end
    
    def destroy
        @review = Review.find(params[:id])
        adventure = @review.adventure
        @review.destroy
        redirect_to adventure
    end
    
    private
    def reviews_params
        params.require(:review).permit(:comment,:star, :adventure_id)
    end
end
