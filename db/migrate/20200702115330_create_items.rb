class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.references :shipping_charges, null: false
      t.references :shipping_from, null: false
      t.references :shipping_days, null: false
      t.references :item_image, null: false
      t.references :seller, null: false
      t.references :buyer, null: false
      t.timestamps
    end
  end
end
