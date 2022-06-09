class StaffMailer < ApplicationMailer

  def send_staff
    mail(
      from: "admin@strangetrails.net",
      to: "jackthelion83@gmail.com",
      subject: "Staffing"
    )
  end
end