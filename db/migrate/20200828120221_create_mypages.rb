class CreateMypages < ActiveRecord::Migration[6.0]
  def change
    create_table :mypages do |t|
      t.references :user,foreign_key:true
      t.integer :dog_love_id,null: false
      t.text :text,null: false
      

      t.timestamps
    end
  end
end
