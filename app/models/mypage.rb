class Mypage < ApplicationRecord
  belongs_to :user
  has_one_attached :mypage_picture
  
end
