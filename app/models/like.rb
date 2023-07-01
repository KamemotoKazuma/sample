class Like < ApplicationRecord
  belongs_to :anime
  belongs_to :user
  
  validates_uniqueness_of :anime_id, scope: :user_id
end
