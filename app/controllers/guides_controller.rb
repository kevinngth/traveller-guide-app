class GuidesController < ApplicationController

  def index
    @user = current_user
    @guide = @user.guide
    @conversations = Conversation.all
    @reviews = Review.all
  p @reviews[0].body
  end

  def show
    @guide = Guide.find(params[:id])
  end

end