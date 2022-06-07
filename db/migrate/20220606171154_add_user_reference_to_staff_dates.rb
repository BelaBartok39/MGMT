class AddUserReferenceToStaffDates < ActiveRecord::Migration[7.0]
  def change
    add_reference :staff_dates, :user, null: false, foreign_key: true
  end
end
