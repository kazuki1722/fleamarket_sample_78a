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
end
