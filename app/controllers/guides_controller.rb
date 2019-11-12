class GuidesController < ApplicationController

  before_action  :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    byebug
    @guide.user = current_user
    if @guide.save
      redirect_to '/guides'
    else
      render 'new'
    end
  end

  private def guide_params
    params.require(:guide).permit(:bio)
  end

end