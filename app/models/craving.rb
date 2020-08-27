class Craving < ApplicationRecord
  belongs_to :user
  has one :situation
  has one :negotiation
end
