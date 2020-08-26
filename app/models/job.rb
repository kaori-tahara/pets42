class Job < ApplicationRecord
  has_one_attached :dog_picture
  belongs_to :user
  has_one    :situation
  has_one    :negotiation
end
