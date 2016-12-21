class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions , dependent: :destroy
    validates :balance, :numericality => { :greater_than_or_equal => 0 }, :presence => true
    attr_accessor :amount 


  def deposit(i)
    t = (Time.now-6.hours).beginning_of_day 
    if i[:amount].to_f <= 0.0
      self.errors[:base] << "can not be Negative OR empty"
      puts "xxxxxxxx #{self.errors.full_messages.to_sentence} xxxxxxxx"
      return false
    else
      if ((Transaction.where("account_id =? and created_at>=? and debit=?",id,t,true).sum(:amount).to_f)+i[:amount].to_f) > 1000
        errors.add(:amount," more than a thousand in same day is not allowed")        
        return false 
      else
        self.balance = balance.to_f + i[:amount].to_f
        self.save        
        return true
      end
    end
  end
  


  def withdrawal(i)
    t = (Time.now-6.hours).beginning_of_day
    if i[:amount].to_f <= 0.0 

      errors.add(:amount, "can not be Negative OR Empty ")
      return false
    else
      if (self.balance.to_f  - i[:amount].to_f < 0.0 )
        errors.add(:CAN,"NOT WITHDRAWAL MORE THAN THE AVAILABLE BALANCE")
        return false
      else
        if ((Transaction.where("account_id =? and created_at>=? and debit=?",id,t,false).sum(:amount).to_f)+i[:amount].to_f) > 500
          errors.add(:YOU,"Withdrawal more than a $500 in same day is not allowed")        
          return false
        else
          self.balance = balance.to_f - i[:amount].to_f
          self.save
          return true
        end
      end
    end
  end
 
end
