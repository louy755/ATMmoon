class AddAtmMachToTransactionsTable < ActiveRecord::Migration
  def change
    add_reference :transactions, :atm_mach, index: true
  end
end






