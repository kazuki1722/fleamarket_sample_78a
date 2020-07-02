class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_family_name, null: false
      t.string :address_first_name, null: false
      t.string :address_family_name_kana, null: false
      t.string :address_first_name_kana, null: false
      t.integer :zipcode, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.integer :phone_number
      t.references :user
      t.timestamps
    end
  end
end
