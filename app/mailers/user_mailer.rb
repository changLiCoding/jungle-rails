class UserMailer < ApplicationMailer
  default from: 'notifications@jungle.com'


  def welcome_email
    @user = params[:user]
    @url  = 'http://localhost:3000/sign_in'
    mail(to: @user.e_mail, subject: 'Welcome to My Awesome Site')
  end

  def send_order_receipt @order

    mail(to: @order.email, subject: 'Order Receipt. Thanks for shopping with us!')
  end
end
