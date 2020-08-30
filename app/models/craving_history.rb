class CravingHistory < ApplicationRecord
  belongs_to :user
  belongs_to :craving
  belongs_to :mypage
end
