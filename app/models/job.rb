class Job < ApplicationRecord
  has_one_attached :dog_picture
  belongs_to :user
  has_one    :job_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :working_hour
  belongs_to_active_hash :working_time
  belongs_to_active_hash :experience
end
