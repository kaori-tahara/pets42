class CreateCravings < ActiveRecord::Migration[6.0]
  def change
    create_table :cravings do |t|
      t.integer :user_id, foreign_key: true,null: false
      t.string :title,null: false
      t.text  :text ,null: false 
      t.integer :experience_id ,null: false
      t.integer :working_hour_id,null: false
      t.date  :working_date,null: false
      t.integer :working_time_id,null: false

      t.timestamps
    end
  end
end
