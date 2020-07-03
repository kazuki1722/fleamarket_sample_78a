class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false, unque: false
      t.references :shipping_charges_id, null: false, unque: false
      t.references :shipping_from_id, null: false, unque: false
      t.references :shipping_days_id, null: false, unque: false
      t.references :item_image_id, null: false, unque: false
      t.references :seller_id, null: false, unque: false
      t.references :buyer_id, null: false, unque: false
      t.timestamps
    end
  end
end
