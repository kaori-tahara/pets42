class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.string :title
      t.text :content
      t.datetime :vlog_day
      t.references :user,foreign_key:true
      t.references :mypage,foreign_key:true

      t.timestamps
    end
  end
end
