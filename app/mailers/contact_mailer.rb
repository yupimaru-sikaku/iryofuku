class ContactMailer < ApplicationMailer

  default from: 'no-replay@gmail.com'

  # 今回は管理者の返信がユーザーのe-mailに届くようにします。なのでメソッドをsend_when_admin_replyと定義しました。
  def complete_mail(user)
    @user = user
    mail(subject: "イリョフクに会員登録いただきありがとうございます" ,to: @user.email)
  end

end
