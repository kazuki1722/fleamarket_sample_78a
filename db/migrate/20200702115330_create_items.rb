class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :condition, null: false
      t.integer :price, null: false
      t.references :category_id
      t.references :item_image
      t.references :seller
      t.references :buyer
      t.timestamps
    end
  end
end
