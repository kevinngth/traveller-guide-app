class TravellersController < ApplicationController


  before_action :authenticate_user!


  def index
    @user = current_user
    @users = User.all
    @conversations = Conversation.all
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