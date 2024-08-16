class Comment < ApplicationRecord

  #アソシエイション
  belongs_to :user
  belongs_to :prototype

  #バリテイション
  validates :content, presence: true

end
