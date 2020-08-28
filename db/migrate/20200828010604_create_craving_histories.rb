class CreateCravingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :craving_histories do |t|
      t.integer :craving_id, foreign_key: true,null: false
      t.integer :user_id, foreign_key: true,null: false

      t.timestamps
    end
  end
end
