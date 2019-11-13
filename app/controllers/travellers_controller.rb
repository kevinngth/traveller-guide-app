class TravellersController < ApplicationController

  def index
  end

  def becomeaguide
    @user = current_user
    @guide = Guide.new
  end

  def makeguide
    @user = current_user
    @guide = Guide.new(guide_params)
    @guide.user = current_user
    if @guide.save
      @user.update(is_guide: true)
      redirect_to '/guides'
    else
      redirect_to '/travellers/becomeaguide'
    end
  end

  private def guide_params
    params.require(:guide).permit(:bio)
  end

end