class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :condition_id, :integer, null: false
    change_column :items, :shipping_charge_id, :integer, null: false
    change_column :items, :shipping_day_id, :integer, null: false
    change_column :items, :prefecture_id, :integer, null: false
  end
  def down
    change_column :items, :condition, :string, null: false
    change_column :items, :shipping_charges, :string, null: false
    change_column :items, :shipping_from, :string, null: false
    change_column :items, :shipping_days, :string, null: false
  end
  def change
    add_column :items, :seller_id, :integer, null: false
    add_column :items, :buyer_id, :integer 
    add_column :items, :category, :references, null: false
    add_column :items, :brand, :string
  end
end
