class CravingHistory < ApplicationRecord
  belongs_to :craving
  has_one :user, through: :craving
end
