class StaffDate < ApplicationRecord
  has_many :employees, dependent: :destroy
  belongs_to :user

  validates :date, presence: true

  scope :ordered, -> { order(date: asc) }

  def previous_date
    staff_dates.ordered.where("date < ?", date).last
  end

  broadcasts_to ->(staff_date) { [staff_date, "staff_dates"] }, inserts_by: :prepend
end
