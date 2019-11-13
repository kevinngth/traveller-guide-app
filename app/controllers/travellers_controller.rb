class TravellersController < ApplicationController
  def index
    @user = current_user
  end

  def findguide
    @name = current_user.name
    @categories = Category.all

  end

  def createsearch
    p '@@@@@@@@@@@@@@@@@@@'
    x = params[:experience][:category_ids]
    p '@@@@@@@@@@@@@@@@@@@@@'
    x = x.map{|y| y.to_i}
    @parameter = params[:search]
    @guides = Guide.joins(:user).where('location LIKE :search', search: @parameter)
    @experiences = Experience.where('category_id IN (?) ', x)

   @found_guides =
    p '####################'
    p @experiences
    p '####################'

# joins(:category).where('id ')
  end

  def becomeaguide
  @user = current_user
  end

  def makeguide
  @user = current_user
  @user.update(user_params)
  redirect_to '/guides'
  end

  private

  def user_params

 params.require(:user).permit(:guide)
  end



end