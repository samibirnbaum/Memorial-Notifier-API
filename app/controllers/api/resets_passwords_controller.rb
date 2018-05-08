class Api::ResetsPasswordsController < ApplicationController
    def reset
        @user = User.find_by_email(params["user"]["email"])
        if @user.present?
            @temp_password = SecureRandom.hex(6)
            User.update(@user.id, password: @temp_password)
            UserNotifierMailer.send_password_reset_email(@user, @temp_password).deliver
            render json: {message: "email instructions have been sent to #{params["user"]["email"]} to reset password"}
        else
            render json: {message: "email '#{params["user"]["email"]}' is invalid"}
        end
    end
end
