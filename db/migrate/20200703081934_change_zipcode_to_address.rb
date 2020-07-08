class ChangeZipcodeToAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :zipcode, :string
  end
end
