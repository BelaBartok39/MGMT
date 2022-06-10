class StaffDate < ApplicationRecord
  has_many :employees, dependent: :destroy
  belongs_to :user

  validates :date, presence: true

  scope :ordered, -> { order(date: asc) }

  def previous_date
    staff_dates.ordered.where("date < ?", date).last
  end

  def send_email
    @employees = @staff_date.employees.find(params[:staff_date_id])
    StaffMailer.with(employees: @staff_date.employees).send_staff.deliver_later
    flash.now[:notice] = "Staff was successfully sent"
    head :ok
  end

  broadcasts_to ->(staff_date) { [staff_date, "staff_dates"] }, inserts_by: :prepend
end
