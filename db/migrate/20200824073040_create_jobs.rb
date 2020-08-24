class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|

      t.timestamps
      t.text :title,null:false
      t.text :text,null:false
      t.text :dog_picture,null:false 
      t.string :dog_name,null:false
      t.string :dog_bleed,null:false
      t.integer :dog_age,null:false
      t.references :user,null: false,foreign_key:true
      t.integer :working_hours_id,null:false
      t.integer :working_date_id,null:false
      t.integer :prefecture_id,null:false
      t.string :city,null:false
      t.integer :working_time_id ,null:false 

    end
  end
end