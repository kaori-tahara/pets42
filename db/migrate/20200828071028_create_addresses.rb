class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip,null: false
      t.string :prefecture_id,null: false
      t.string :city,null: false
      t.string :phone,null: false
      t.references :user

      t.timestamps
    end
  end
end
