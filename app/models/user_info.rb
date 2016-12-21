class UserInfo < ActiveRecord::Base
  belongs_to :user
  validates :first_name,:last_name,:email,:city,:state,:street,:zip_code, :presence => true      
  validates_format_of :phone,:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,:message => "- Phone numbers must be in xxx-xxx-xxxx format."
  validates :first_name, uniqueness: { scope: [:last_name,:email] , message: "or last name should be unique" },case_sensitive: false
  after_create :create_account

  private
    def create_account
      Account.create(user_id: user_id , balance: 0.0) 
    end

end
