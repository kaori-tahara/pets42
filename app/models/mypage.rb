class Mypage < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :mypage_picture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dog_love
end
