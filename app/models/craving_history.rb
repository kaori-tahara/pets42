class CravingHistory < ApplicationRecord
  belongs_to :craving
  belongs_to :user
  
end
