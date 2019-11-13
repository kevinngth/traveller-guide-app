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
    @parameter = params[:search]
    @guides = Guide.joins(:user).where('location LIKE :search', search: @parameter)
 
    @experiences = Experience.where('category_id IN (?) ', x)
 

    p '//////////!!!!!!!!!'
    p @guides
    @guides_ids = @guides.map{|x|x.id}
    p '//////?!!!!!!!!'

    x = params[:experience][:category_ids]
    x = x.map{|y| y.to_i}
    @experiences = Experience.where('category_id IN (?) AND guide_id IN (?)', x,@guides_ids)

    # @guides.each do |x|
    #   x.experiences.each do |y|
    #     if y.guide_id === x.id
    #       p "AAAAAAAA????????????????????"
    #       p x
    #       p y
    #     else
    #       puts "sorry no match"
    #     end
    #   end
    # end


 
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