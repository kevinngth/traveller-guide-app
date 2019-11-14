class GuidesController < ApplicationController

  def index
    @user = current_user
    @guide = @user.guide
    @conversations = Conversation.all
    @reviews = Review.all.sort_by(&:created_at).reverse
  
  end

  def show
    @guide = Guide.find(params[:id])
  end

end