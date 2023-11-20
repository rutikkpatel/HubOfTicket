class PaymentSuccessMailer < ApplicationMailer
  default from: 'abx1769@gmail.com'

  def new_payment_email(user,session_with_expand)
    @user = user
    @session_with_expand = session_with_expand
    mail(to: @user.email, subject: "Ticket Booking with Hub of Ticket!")
  end
end
