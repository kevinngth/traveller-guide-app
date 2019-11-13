class ExperiencesController < ApplicationController

  def authenticate_guide!
    # check if current user is guide
    unless current_user.guide
      # if current_user is not guide redirect to some route
      redirect_to '/'
    end
    # if current_user is guide he will proceed to new/edit
  end

  before_action :authenticate_guide!, only: [:new, :edit]

  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
    @categories = Category.all
  end

  def create
    @experience = Experience.new(experience_params)
    @categories = Category.all
    @guide = Guide.find(params[:guide_id])
    byebug
    if @experience.save
      redirect_to '/guides'
    else
      render 'new'
    end
  end

  def edit
    @experience = experience.find(params[:id])
    @categories = Category.all
  end

  def update
    @experience = experience.find(params[:id])
    @experience.update(experience_params)
    redirect_to @experience
  end

  def show
    @experience = experience.find(params[:id])
  end

  def destroy
    @experience = experience.find(params[:id])
    @experience.destroy
    redirect_to @experience
  end

  private def experience_params
    params.require(:experience).permit(:title, :description, :img, :category_id, :guide_id)
  end
end