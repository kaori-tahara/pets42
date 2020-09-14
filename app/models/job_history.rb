class JobHistory < ApplicationRecord
  belongs_to :job
  has_one :user, through: :job
end
