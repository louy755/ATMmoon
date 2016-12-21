class CreateAtmMaches < ActiveRecord::Migration
  def change
    create_table :atm_maches do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :street

      t.timestamps null: false
    end
  end
end
