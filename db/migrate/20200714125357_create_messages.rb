class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :delete_check,default: 0
      t.string :message
      t.timestamps
    end
  end
end
