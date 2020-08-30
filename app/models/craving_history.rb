class CravingHistory < ApplicationRecord
  belongs_to :user
  belongs_to :craving
  
end
