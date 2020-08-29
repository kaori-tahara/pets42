class CreateMypages < ActiveRecord::Migration[6.0]
  def change
    create_table :mypages do |t|
      t.references :user,foreign_key:true,null: false
      t.references :address,foreign_key:true,null: false
      t.integer :dog_love_id,null: false
      t.text :text,null: false
      t.integer :job_id,foreign_key: true,null: false
      t.integer :craving_id, foreign_key: true,null: false

      t.timestamps
    end
  end
end
