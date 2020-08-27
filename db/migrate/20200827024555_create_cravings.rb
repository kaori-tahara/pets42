class CreateCravings < ActiveRecord::Migration[6.0]
  def change
    create_table :cravings do |t|
      t.references,user,

      t.timestamps
    end
  end
end


| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
|             |  | null: false, foreign_key: true |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| experience_id    | integer    | null: false                    |
| working_hour_id  | integer    | null: false                    |
| working_date     | date       | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| working_time_id  | integer    | null: false                    |
