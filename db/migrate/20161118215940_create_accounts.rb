class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :balance  , null: false, default: 0 
      t.string :account_number
      t.integer :user_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
