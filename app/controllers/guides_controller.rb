class GuidesController < ApplicationController

  def index
    @user = current_user
    @guide = @user.guide
  end

end