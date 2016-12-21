# Preview all emails at http://localhost:3000/rails/mailers/email
class EmailPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email/testemailformustafa
  def testemailformustafa
    
    transaction = Transaction.last
    
    Email.alert(transaction)
  end

end
