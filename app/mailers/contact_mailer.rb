class ContactMailer < ApplicationMailer

  default from: ENV['gmail_address']

  def complete_mail(company)
    @company = company
    mail(subject: "イリョフクに会員登録いただきありがとうございます", to: @company.email)
  end
  
  def iryo_gh_mail(gh, registered_address)
    @registered_address = registered_address
    @gh = gh
    mail(subject: "事業所をお探しの方がいらっしゃいます", to: @gh.pluck(:human_email))
  end


end