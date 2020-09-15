require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'zip,city,address,phone_number,prefecture_idがあれば登録できる' do
        @address = FactoryBot.build(:address)
        expect(@address).to be_valid
      end
    end
  end
end
