class Address < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { greater_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :phone, numericality: { only_integer: true }, format: { with: /\A\d{11}\z/ }
  end
end
