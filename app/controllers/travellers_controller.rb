class TravellersController < ApplicationController
  def index
  end


  def becomeaguide
  @user = current_user
  end

  def makeguide
  @user = current_user
  @user.update(user_params)
  redirect_to '/guides/new'
  end

  private

  def user_params

 params.require(:user).permit(:guide)
  end

end