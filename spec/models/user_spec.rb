require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname,email,password,first_name,family_name,first_kana,family_kanaが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'nicknameが40文字以下であれば登録できる' do
          @user.nickname = 'aaaaaaaaaabbbbbbbbbbccccccccccdddddddddd'
          expect(@user).to be_valid
        end
  
        it 'passwordが６文字以上であれば登録できる' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aaa'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームを入力してください")
        end

        it 'nicknameが40文字以上だと登録できない' do
          @user.nickname = 'aaaaaaaaaabbbbbbbbbbccccccccccdddddddddda'
          @user.valid?
          expect(@user.errors.full_messages).to include("ニックネームは40文字以内で入力してください")
        end

        it '誕生日が空だと登録できない' do
          @user.birth = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthを入力してください")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end

        it '@を含まないemailは登録できない' do
          @user.email = 'aaapppee'
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

        it 'passwordが6文字以下であれば登録できない' do
          @user.password = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end

        it 'passwordは英数字を含めないと登録できない' do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end

        it 'first_nameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First nameを入力してください")
        end

        it 'first_nameが全角でないと登録できない' do
          @user.first_name = 'kiyoko'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name全角を使用してください")
        end

        it 'family_nameが空だと登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family nameを入力してください")
        end

        it 'family_nameが全角でないと登録できない' do
          @user.family_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name全角を使用してください")
        end

        it 'first_kanaが空だと登録できない' do
          @user.first_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First kanaを入力してください")
        end

        it 'first_kanaが全角カタカナでないと登録できない' do
          @user.first_kana = 'きよこ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First kana全角(カタカナ)を使用してください')
        end

        it 'family_kanaが空だと登録できない' do
          @user.family_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family kanaを入力してください")
        end

        it 'family_kanaが全角カタカナでないと登録できない' do
          @user.family_kana = 'やまだ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family kana全角(カタカナ)を使用してください")
        end
      end
   end
end
