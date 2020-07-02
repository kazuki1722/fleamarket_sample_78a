class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false, unque: false
      t.reference :shipping_charges_id, null: false, unque: false
      t.reference :shipping_from_id, null: false, unque: false
      t.reference :shipping_days_id, null: false, unque: false
      t.reference :item_image_id, null: false, unque: false
      t.reference :seller_id, null: false, unque: false
      t.reference :buyer_id, null: false, unque: false
      t.timestamps
    end
  end
end
