class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.string :shipping_charges, null: false
      t.string :shipping_from, null: false
      t.string :shipping_days, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
  def up
    change_column :items do |t|
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :prefecture_id, null: false
    end
  end
  def down
    change_column :items do |t|
      t.string :condition, null: false
      t.string :shipping_charges, null: false
      t.string :shipping_from, null: false
      t.string :shipping_days, null: false
  end
  def change
    add_column :items do |t|
      t.integer :seller_id, null: false
      t.integer :buyer_id
      t.references :category, null: false
      t.string :brand
      
  end

end
