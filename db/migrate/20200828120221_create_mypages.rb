class CreateMypages < ActiveRecord::Migration[6.0]
  def change
    create_table :mypages do |t|
      t.references :user,null: false,foreign_key:true
      t.references :address,null: false,foreign_key:true
      t.string :dog_love_id,null: false
      t.text :text,null:false
      

      t.timestamps
    end
  end
end
