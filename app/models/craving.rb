class Craving < ApplicationRecord
  belongs_to :user
  has_one :craving_history
  has_one_attached :craving_picture

  paginates_per 8

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :working_hour
  belongs_to_active_hash :working_time
  belongs_to_active_hash :experience

  with_options presence: true do
    validates :title
    validates :text
  end

  with_options presence: true, numericality: { greater_than: 1 } do
    validates :experience_id
    validates :working_hour_id
    validates :working_date
    validates :working_time_id
  end
end
