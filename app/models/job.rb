class Job < ApplicationRecord
  has_one_attached :dog_picture
  belongs_to :user
  has_one    :job_history

  paginates_per 8

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :working_hour
  belongs_to_active_hash :working_time
  belongs_to_active_hash :experience

  with_options presence: true do
    validates :title
    validates :text
    validates :dog_name
    validates :dog_bleed
    validates :dog_age
    validates :working_date
  end

  with_options presence: true, numericality: { greater_than: 1 } do
    validates :working_hour_id
    validates :working_time_id
  end
end
