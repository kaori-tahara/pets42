class Mypage < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :mypage_picture
  has_many :job_histories
  has_many :craving_histories

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :dog_love
end
