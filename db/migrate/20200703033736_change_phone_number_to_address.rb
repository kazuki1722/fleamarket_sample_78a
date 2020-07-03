class ChangePhoneNumberToAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :phone_number, :string
  end
end
