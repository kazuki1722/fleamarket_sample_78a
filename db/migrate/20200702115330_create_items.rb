class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.string :condition
      t.integer :price
      t.integer :category_id
      t.reference :shipping_charges_id
      t.reference :shipping_from_id
      t.reference :shipping_days_id
      t.reference :item_image_id
      t.reference :seller_id
      t.reference :buyer_id
      t.timestamps
    end
  end
end
