class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :merchent_name
      t.boolean :debit ,  null: false, default: false
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
