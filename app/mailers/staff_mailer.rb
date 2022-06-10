class StaffMailer < ApplicationMailer

    def send_staff(user)
      @employees = params[:employees]
      mail(
        from: "admin@strangetrails.net",
        to: user.email,
        subject: "Staffing"
      )
    end

  end
