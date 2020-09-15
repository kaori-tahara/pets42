require 'rails_helper'

RSpec.describe Mypage, type: :model do
  describe 'マイページ新規登録' do
    context '新規登録がうまくいくとき' do
      it 'textとdog_love_idがあれば登録できる' do
        @mypage = Mypage.new(text:"xxxxx",dog_love_id:"2")
        expect(@mypage).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'textがないと登録できない' do
        @mypage = Mypage.new(text:"")
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Textを入力してください")
      end

      it 'textがないと登録できない' do
        @mypage = Mypage.new(dog_love_id:"")
        @mypage.valid?
        expect(@mypage.errors.full_messages).to include("Dog loveを入力してください")
      end
    end
  end
end
