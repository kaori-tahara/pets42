require 'rails_helper'

RSpec.describe Craving, type: :model do
  before do
    @craving = FactoryBot.build(:craving)
  end

  describe '散歩提供登録' do
    context '散歩提供登録がうまくいくとき' do
      it '写真以外の項目を全て入力していれば登録できる' do
        expect(@craving).to be_valid
      end
    end

    context '散歩提供登録がうまくいかないとき' do
      it 'experience_idが空だと登録できない' do
        @craving.experience_id = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Experienceを入力してください')
      end

      it 'working_hour_idが空だと登録できない' do
        @craving.working_hour_id = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Working hourを入力してください')
      end

      it 'working_dateが空だと登録できない' do
        @craving.working_date = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Working dateを入力してください')
      end

      it 'working_time_idが空だと登録できない' do
        @craving.working_time_id = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Working timeを入力してください')
      end

      it 'titleが空だと登録できない' do
        @craving.title = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Titleを入力してください')
      end

      it 'textが空だと登録できない' do
        @craving.text = ''
        @craving.valid?
        expect(@craving.errors.full_messages).to include('Textを入力してください')
      end
    end
  end
end
