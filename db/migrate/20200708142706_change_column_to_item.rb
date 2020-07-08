class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :condition, :string, null: false
    remove_column :items, :shipping_charges, :string, null: false
    remove_column :items, :shipping_from, :string, null: false
    remove_column :items, :shipping_days, :string, null: false
    add_column :items, :category, :references, null: false
    add_column :items, :brand, :string
    add_column :items, :condition_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false  
    add_column :items, :shipping_charge_id, :integer, null: false
    add_column :items, :shipping_day_id, :integer, null: false
    add_column :items, :seller_id, :integer, null: false
    add_column :items, :buyer_id, :integer 
  end
end
