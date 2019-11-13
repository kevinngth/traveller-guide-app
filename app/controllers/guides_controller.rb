class GuidesController < ApplicationController

  def index
    @user = current_user
    @guide = @user.guide
    @conversations = Conversation.all
  end

  def show
    @guide = Guide.find(params[:id])
  end

end