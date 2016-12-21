class Email < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.email.testemailformustafa.subject
  #
  def alert(account,amo,atm_name)
    
    @atm_name = atm_name
    @amount_tra =amo


    mail to: account.user.email,
  subject: "new transaction on your account with $#{amo} " 
  end
end
