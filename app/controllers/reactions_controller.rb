class ReactionsController < ApplicationController
    before_action :authenticate_user!

    def create
      anime = Anime.find(params[:anime_id])
      reaction = anime.reactions.build(reaction_params) #buildを使い、contentとtweet_idの二つを同時に代入
      reaction.user_id = current_user.id
      if reaction.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
      end
    end
  
    private
  
      def reaction_params
        params.require(:reaction).permit(:content)
      end
end
