class UserNotifierMailer < ApplicationMailer
    def send_password_reset_email(user, temp_password)
      @user = user
      @temp_password = temp_password
      mail(to: @user.email, subject: 'Memorial Notifier Password Reset')
    end
end
