class TravellersController < ApplicationController

  before_action :authenticate_user!
  def landing
    redirect_to '/travellers/dashboard'
  end
  def index
    @user = current_user
    # @guide = @user.guide
    @users = User.all
    # @conversations = Conversation.all.sort_by {|obj| obj.created_at}
    @conversations = Conversation.all
    @unread = cookies[:unread]

  end

  def findguide
    @name = current_user.name
    @categories = Category.all
  end

  def createsearch
    @categories = Category.all
    @parameter = params[:search].split.map(&:capitalize).join(' ')
    @guides = Guide.joins(:user).where('location LIKE :search', search: @parameter)
      @reviews = Review.all

    @guides_ids = @guides.map{|x|x.id}

    @rating = rand(5).floor

    session[:search]= params[:search]

    if params.has_key?(:experience)
      session[:experience] = params[:experience]
      x = params[:experience][:category_ids]
      x = x.map{|y| y.to_i}
      @experiences = Experience.where('category_id IN (?) AND guide_id IN (?)', x,@guides_ids)
    else
      @experiences = Experience.where('guide_id IN (?)', @guides_ids)
    end

    ids = @experiences.distinct(:guide_id).pluck(:guide_id).map{|y| y}
    @unique = Guide.where('id IN (?)',ids).sort_by{|guide| @reviews.where(guide_id: guide).average("rating")|| 0}.reverse!
     redirect_to '/travellers/searchresults'
  end

  def persistentresults

     @categories = Category.all
     @reviews = Review.all
     @user = current_user
    @parameter = session[:search].split.map(&:capitalize).join(' ')
     @guides = Guide.joins(:user).where('location LIKE :search', search: @parameter)
    @guides_ids = @guides.map{|x|x.id}

    if params.has_key?(:experience)
      x = session[:experience][:category_ids].map{|y| y.to_i}
      @experiences = Experience.where('category_id IN (?) AND guide_id IN (?)', x,@guides_ids)
    else
      @experiences = Experience.where('guide_id IN (?)', @guides_ids)
    end

    ids = @experiences.distinct(:guide_id).pluck(:guide_id).map{|y| y}

    @unique = Guide.where('id IN (?)',ids).sort_by{|guide| @reviews.where(guide_id: guide).average("rating")|| 0}.reverse!

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

 def profilepic

 end

 def createpic

 end

  private def guide_params
    params.require(:guide).permit(:bio)
  end


  def user_params
    params.require(:user).permit(:name, :email, :location)
  end

end