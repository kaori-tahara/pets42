class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :mypage
  has_many :jobs
  has_many :cravings
  has_many :job_histories
  has_many :craving_histories
  has_one  :address
end
