class Employee < ApplicationRecord
  belongs_to :staff_date

  validates :name, presence: true
  validates :employee_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  

  # broadcasts_to ->(staff_date) { "staff_dates" }, inserts_by: :prepend
end
