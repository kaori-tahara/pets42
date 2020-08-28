class CreateJobHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :job_histories do |t|
      t.integer :job_id,foreign_key: true
      t.integer :user_id, foreign_key: true,null: false

      t.timestamps
    end
  end
end
