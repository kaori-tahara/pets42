class Calendar < ApplicationRecord
  belongs_to :mypage
  has_one :user, through: :mypage
  
  def start_time
    self.vlog_day
  end 
end
