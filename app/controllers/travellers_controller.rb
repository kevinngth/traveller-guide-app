class TravellersController < ApplicationController
  def index
    @user = current_user
  end

  def findguide
    @name = current_user.name

  end

  def createsearch
    @parameter = params[:search]
    @guides = Guide.joins(:user).where('location LIKE :search', search: @parameter)


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