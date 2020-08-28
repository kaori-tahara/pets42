class JobHistory < ApplicationRecord
  belongs_to :Job
  belongs_to :user
end
