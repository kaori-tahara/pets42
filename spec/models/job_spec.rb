require 'rails_helper'

RSpec.describe Job, type: :model do
  before do
    @job = FactoryBot.build(:job)
  end

  describe '散歩依頼登録' do
    context '散歩提供登録がうまくいくとき' do
      it '写真以外の項目を全て入力していれば登録できる' do
        expect(@job).to be_valid
      end
    end

    context '散歩提供登録がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @job.title = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Titleを入力してください')
      end

      it 'textが空だと登録できない' do
        @job.text = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Textを入力してください')
      end

      it 'dog_nameが空だと登録できない' do
        @job.dog_name = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Dog nameを入力してください')
      end

      it 'dog_bleedが空だと登録できない' do
        @job.dog_bleed = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Dog bleedを入力してください')
      end

      it 'dog_ageが空だと登録できない' do
        @job.dog_age = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Dog ageを入力してください')
      end

      it 'working_dateが空だと登録できない' do
        @job.working_date = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Working dateを入力してください')
      end

      it 'working_hour_id が空だと登録できない' do
        @job.working_hour_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Working hourを入力してください')
      end

      it 'working_time_id が空だと登録できない' do
        @job.working_time_id = ''
        @job.valid?
        expect(@job.errors.full_messages).to include('Working timeを入力してください')
      end
    end
  end
end
