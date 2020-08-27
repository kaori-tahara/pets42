class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.integer :working_hour_id , null: false 
      t.date :working_date,null: false
      t.integer :prefecture_id,null: false
      t.string  :city,null: false
      t.integer :working_time_id,null: false
      t.bigint :job_id,foreign_key: true
      t.bigint :craving_id, foreign_key: true
      t.integer :user_id, foreign_key: true,null: false


      t.timestamps
    end
  end
end

