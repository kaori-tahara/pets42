require 'rails_helper'
RSpec.describe Address, type: :model do
  describe '#create' do
     before do 
      @address = FactoryBot.build(:address)
     end

    context '新規登録がうまくいくとき' do
      it 'zip,city,address,phone_number,prefecture_idがあれば登録できる' do
        expect(@address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'zipが空だと登録できない' do
        @address.zip = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Zipを入力してください")
      end

      it 'zipがハイフン抜きだと登録できない' do
        @address.zip = '1231234'
        @address.valid?
        expect(@address.errors.full_messages).to include("Zipは不正な値です")
      end

      it 'zipが全角だと登録できない' do
        @address.zip = '１２３−１２３４'
        @address.valid?
        expect(@address.errors.full_messages).to include("Zipは不正な値です")
      end

      it 'prefecture_idが空だと登録できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefectureを入力してください")
      end

      it 'cityが空だと登録できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Cityを入力してください")
      end

      it 'cityが半角だと登録できない' do
        @address.city = 'ｲﾄｼﾏｻ'
        @address.valid?
        expect(@address.errors.full_messages).to include("City全角文字を使用してください")
      end

      it 'phoneが空だと登録できない' do
        @address.phone = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phoneを入力してください")
      end

      it 'phoneが数字でないと登録できない' do
        @address.phone = 'あいう'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phoneは数値で入力してください")
      end

      it 'phoneが１１桁でないと登録できない' do
        @address.phone = '0901234123'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phoneは不正な値です")
      end
    end
  end
end
