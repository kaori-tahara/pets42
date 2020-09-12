class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :mypage
  has_many :jobs
  has_many :cravings
  has_one  :address
  has_many :job_histories,through: :jobs
  has_many :craving_histories,through: :cravings

  with_options presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: '全角(カタカナ)を使用してください' } do
    validates :first_kana
    validates :family_kana
  end

  with_options presence: true do
    validates :nickname,length: { maximum: 40 }
    validates :birth
    validates :email,uniqueness: true
  end

    validates :email,format: { with: /@.+/ }

  # validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
  # validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }


  
end
