class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :prefecture_id, null: false
      t.string :brand
      t.integer :likes_count
      t.references :seller, null: false
      t.references :buyer
      t.references :category, null: false
      t.timestamps
    end
  end
end
