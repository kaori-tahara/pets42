class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip,null: false
      t.integer :prefecture,null: false
      t.string :city,null: false
      t.integer :phone,null: false
      t.references :user





      t.timestamps
    end
  end
end
