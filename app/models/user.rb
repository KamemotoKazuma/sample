class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    has_many :animes, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_animes, through: :likes, source: :anime
        
    def already_liked?(anime)
      self.likes.exists?(anime_id: anime.id)
    end
    
    has_many :reactions, dependent: :destroy
    
    has_many :animes
         
         
       

         
end
