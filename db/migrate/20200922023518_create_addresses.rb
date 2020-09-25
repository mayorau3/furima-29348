class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,     null: false
      t.integer :prefecture,  null: false
      t.string :city,         null: false
      t.string :address1,     null: false
      t.string :address2
      t.string :phone_num,    null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
