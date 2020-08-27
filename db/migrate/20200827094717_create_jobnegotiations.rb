class CreateJobnegotiations < ActiveRecord::Migration[6.0]
  def change
    create_table :jobnegotiations do |t|
      t.integer :user_id, foreign_key: true,null: false
      t.integer :job_id, foreign_key: true,null: false


      t.timestamps
    end
  end
end
