class AtmMach < ActiveRecord::Base
  has_many :transactions
  def show
    session[:atm_no] = @atm_machine.id
  end
  def sort
    scope :sort, -> { order(id: :asc) }
  end
end

