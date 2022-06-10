# Preview all emails at http://localhost:3000/rails/mailers/staff_mailer
class StaffMailerPreview < ActionMailer::Preview
    def send_email
        
        
        StaffMailer.with(employees: @staff_date.employees).send_staff
      end
end
