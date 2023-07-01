class AnimesController < ApplicationController
  before_action :authenticate_user!

  def index
    @animes = Anime.all
  end

  def new
    @anime = Anime.new
  end

  def create
    anime = Anime.new(anime_params)
    anime.user_id = current_user.id
    if anime.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
#詳細ページ
  def show
    @anime = Anime.find(params[:id])
    @reactions = @anime.reactions
    @reaction = Reaction.new
   
  end
#編集
  def edit
    @anime = Anime.find(params[:id])
  end

  def update
    anime = Anime.find(params[:id])
    if anime.update(anime_params)
      redirect_to :action => "show", :id => anime.id
    else
      redirect_to :action => "new"
    end
  end
#削除
  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to action: :index
  end


  private
  def anime_params
    params.require(:anime).permit(:name,:comment,:picture,:word,:character,:title,tag_ids: [])
  end

end
