class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
