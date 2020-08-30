class JobHistory < ApplicationRecord
  belongs_to :job
  belongs_to :user
  belongs_to :mypage
end
