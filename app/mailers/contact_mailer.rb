class ContactMailer < ApplicationMailer

  default from: ENV['gmail_address']

  def complete_mail(user)
    @user = user
    mail(subject: "イリョフクに会員登録いただきありがとうございます" ,to: @user.email)
  end

end