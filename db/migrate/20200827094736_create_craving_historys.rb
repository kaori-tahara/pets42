class CreateCravingHistorys < ActiveRecord::Migration[6.0]
  def change
    create_table :craving_historys do |t|
      t.integer :user_id, foreign_key: true,null: false
      t.integer :craving_id, foreign_key: true,null: false

      t.timestamps
    end
  end
end