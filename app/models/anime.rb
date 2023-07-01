class Anime < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
 
  has_many :reactions, dependent: :destroy

  mount_uploader :picture, PictureUploader

  has_many :anime_tag_relations, dependent: :destroy

  has_many :tags, through: :anime_tag_relations, dependent: :destroy
end
